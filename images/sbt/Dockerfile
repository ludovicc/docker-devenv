FROM internal_registry:5000/scala

USER root
ENV SBT_VERSION 0.13.5

# Install the package...
RUN wget -O sbt.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
    dpkg -i sbt.deb && \
    rm sbt.deb

USER developer

#TODO ENTRYPOINT ["/usr/bin/tmux"]
