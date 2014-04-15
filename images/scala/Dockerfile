FROM internal_registry:5000/oracle-java8

ENV SCALA_VERSION 2.10.4

RUN wget http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb && \
    apt-get install -y -q libjansi-java && \
    dpkg -i scala-$SCALA_VERSION.deb
