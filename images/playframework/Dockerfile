FROM internal_registry:5000/sbt

USER root
ENV PLAY_VERSION 2.2.2

RUN wget http://downloads.typesafe.com/play/$PLAY_VERSION/play-$PLAY_VERSION.zip && \
    unzip play-$PLAY_VERSION.zip -d /opt && \
    chmod -R a+w /opt/play-$PLAY_VERSION && \
    rm play-$PLAY_VERSION.zip

# play port
EXPOSE 9000 

# play debug port
EXPOSE 9999
