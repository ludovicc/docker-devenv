FROM internal_registry:5000/base-devuser

USER root
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# auto accept oracle jdk license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer
