# Docker Development Environment

This is a one stop docker based development environment.  It comes with riak-cs, scala, zookeeper, kafka, oracle-java7, playframework, and sbt, and probably a bunch more.  It will pull and set up images for absolutely everything.

## Caution

This is personalized for my use.  It's not guaranteed to work all the time. 

Vagrant support is disabled in this fork, I'm waiting that 1.6 is out with native Docker support.

I recommend you clone your own copy:

```
git remote add upstream https://github.com/wsargent/docker-devenv.git
```

then if you want to pull changes, do:

```
git fetch upstream; 
git merge upstream/master;
``` 

It also depends on a public registry image for the docker registry, so that's possibly a security risk.

## Installation

### Install Ansible

On Ubuntu:

    sudo apt-get install -y python-setuptools python-yaml python-jinja2 python-paramiko python-keyczar
    sudo easy_install pip
    sudo pip install ansible
    
### Install Docker, squid-deb-proxy, supervisor and configure then.

    bin/setup.sh


### Build the Docker images
 
    bin/install.sh
    
### Run the images

    images/scala/run

----

## Warning - devenv scripts not supported yet in this fork

### Run devenv install

Now that you have Guest additions, you should be able to install and run the scripts.

```
./bin/devenv install
```

Once this is done, reboot the VM to have Docker pick up the changes needed for Shipyard:

```
vagrant reload
```

## Usage

To start the server:

```
vagrant up
./bin/devenv start
```

To push the local images to registry:

```
./bin/devenv push
```

To export the registry:

```
./bin/devenv export
```

To import registry (CURRENTLY BROKEN):

```
./bin/devenv import
```

## Explanation

It does the following:

* Installs a Vagrant image from Phusion Passenger that is [pre-built with the correct kernel](http://blog.phusion.nl/2013/11/08/docker-friendly-vagrant-boxes/) (so you don't have to update and reboot).
* Installs the VirtualBox Guest Additions (4.3.2, but configurable).
* Downloads and sets up a docker image containing a private repository from the public Docker index (insecure, not ideal).
* Clones this github project from Github inside the Vagrant.
* Runs through a base Docker image that adds important bits to the out of the box Ubuntu 12.04 image.
* Pushes that base docker image to the private Docker repository.

This gives you a base starting point where all your other Dockerfile images can be built starting with:

```
FROM internal_registry:5000/base
```

in your Docker file.

## History

It is based on the Relate-IQ [Vagrantfile](https://github.com/relateiq/docker_public) from the [devenv blog post](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-2-of-2/) .

Additional bits taken from [Mailgun shipper talk](http://www.rackspace.com/blog/how-mailgun-uses-docker-and-contributes-back/).

Some concepts taken from [Phusion base image](https://github.com/phusion/baseimage-docker).
