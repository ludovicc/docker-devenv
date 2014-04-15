# Base image
FROM ubuntu:13.10
MAINTAINER Ludovic Claude <ludovic.claude@laposte.net>
ENV REFRESHED_AT 2014-04-15

# assumes your docker HOST ran "apt-get install -y squid-deb-proxy"
RUN /sbin/ip route | awk '/default/ { print "Acquire::http::Proxy \"http://"$3":18000\";" }' > /etc/apt/apt.conf.d/30proxy

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list.d/ubuntu-universe && \
    apt-get update && \
    apt-get upgrade -y

# Install common packages (from http://youtu.be/1Fm3MJhQZZg)
RUN apt-get install -y \
        aptitude \
        sudo \
        apt-utils \
        ntp \
        build-essential \
        curl \
        tzdata \
        wget \
        less \
        dnsutils \
        gzip \
        tar \
        netcat \
        tmux \
        unzip \
        sysstat \
        git \
        python-software-properties \
        vim \
        zsh \
        software-properties-common

# set up timezone and locale
RUN echo 'Etc/UTC' > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
