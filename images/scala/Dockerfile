FROM internal_registry:5000/oracle-java8

USER root
ENV SCALA_VERSION 2.11.1

ADD tmux-windows.yml /home/developer/.teamocil/scala.yml
RUN mkdir -p /home/developer/.m2/repository /home/developer/.ivy2/cache && chown -R developer:developer /home/developer
RUN wget http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q libjansi-java && \
    dpkg -i scala-$SCALA_VERSION.deb && \
    rm scala-$SCALA_VERSION.deb

USER developer
EXPORT HOME /home/developer
WORKDIR $WORK_DIR
CMD ["/usr/bin/scala"]
