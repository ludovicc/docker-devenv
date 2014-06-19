FROM internal_registry:5000/base-devuser

USER root

# auto accept oracle jdk license
RUN apt-get install -y openjdk-7-jdk

# Clean up APT when done.
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
