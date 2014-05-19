FROM internal_registry:5000/base-devuser

USER root

# auto accept oracle jdk license
RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java7-installer
