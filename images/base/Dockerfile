# Base image, based on Ubuntu 14.04
FROM phusion/baseimage:0.9.10
MAINTAINER Ludovic Claude <ludovic.claude@laposte.net>
ENV REFRESHED_AT 2014-06-20

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# assumes your docker HOST ran "apt-get install -y squid-deb-proxy"
RUN /sbin/ip route | awk '/default/ { print "Acquire::http::Proxy \"http://"$3":18000\";" }' > /etc/apt/apt.conf.d/30proxy

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list.d/ubuntu-universe.list && \
    apt-get update && \
    apt-get upgrade -y

# Install common packages (from http://youtu.be/1Fm3MJhQZZg)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
        aptitude \
        sudo \
        apt-utils \
        build-essential \
        curl \
        tzdata \
        ntp \
        wget \
        less \
        dnsutils \
        gzip \
        bzip2 \
        tar \
        netcat \
        tmux \
        byobu \
        unzip \
        sysstat \
        vim \
        git \
        zsh \
        fish \
        ruby \
        python-software-properties \
        software-properties-common

# Clean up APT when done.
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

# set up timezone and locale
RUN echo 'Etc/UTC' > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
