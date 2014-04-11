# Base image
FROM ubuntu:13.10
MAINTAINER Ludovic Claude <ludovic.claude@laposte.net>
ENV REFRESHED_AT 2014-04-04

# assumes your docker HOST ran "apt-get install -y squid-deb-proxy"
RUN /sbin/ip route | awk '/default/ { print "Acquire::http::Proxy \"http://"$3":18000\";" }' > /etc/apt/apt.conf.d/30proxy

RUN apt-get update

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install common packages (from http://youtu.be/1Fm3MJhQZZg)
RUN apt-get install -y  aptitude sudo apt-utils ntp build-essential curl tzdata wget less dnsutils gzip tar netcat tmux unzip sysstat git python-software-properties vim zsh software-properties-common

# set up timezone
RUN echo 'Etc/UTC' > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# set up locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
