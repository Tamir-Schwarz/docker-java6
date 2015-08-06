# Version: 0.0.1
# java 6
FROM ubuntu:14.04
MAINTAINER Tamir Schwarz "tamir@example.com"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# set default java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle/
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java -y && \
echo debconf shared/accepted-oracle-license-v1-1 select true |  debconf-set-selections && \
echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections && \
apt-get update && \
apt-get install -y --no-install-recommends oracle-java6-installer && \
apt-get install -y --no-install-recommends oracle-java6-set-default && \
rm -rf /var/cache/oracle-jdk6-installer && \
rm -rf /var/lib/apt/lists/*
