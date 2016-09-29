FROM syedahmed/centos:7
MAINTAINER "Syed Ahmed" <ishtiaq_ahmed79@hotmail.com>
USER root

# Upgrade system
RUN yum update -y
RUN yum -y upgrade

ENV JAVA_VERSION 8u101
ENV BUILD_VERSION b13

# Download Java
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

# Install Java
RUN yum -y install /tmp/jdk-8-linux-x64.rpm

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

# Remove temporary files
RUN rm /tmp/jdk-8-linux-x64.rpm

# Set environment variables
ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:$JAVA_HOME/bin

