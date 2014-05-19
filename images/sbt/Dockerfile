FROM internal_registry:5000/scala

USER root
ENV SBT_VERSION 0.13.1

# Install the package...
RUN wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/$SBT_VERSION/sbt.deb && \
    dpkg -i sbt.deb && \
    rm sbt.deb

USER developer

#TODO ENTRYPOINT ["/usr/bin/tmux"]
