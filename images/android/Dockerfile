FROM internal_registry:5000/oracle-java7

USER root

ENV ANDROID_SDK_VERSION 22.6.2
ENV ANDROID_NDK_VERSION 9d
ENV ANT_VERSION 1.9.4

# Fake a fuse install (to prevent ia32-libs-multiarch package from producing errors)
#RUN apt-get install libfuse2 && \
#    cd /tmp && \
#      apt-get download fuse && \
#      dpkg-deb -x fuse_* . && \
#      dpkg-deb -e fuse_* && \
#      rm fuse_*.deb && \
#      echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst && \
#      dpkg-deb -b . /fuse.deb && \
#      dpkg -i /fuse.deb

# Install support libraries for 32-bit
#RUN apt-get -y install ia32-libs-multiarch

# Install android sdk
RUN wget http://dl.google.com/android/android-sdk_r$ANDROID_SDK_VERSION-linux.tgz
RUN tar -xvzf android-sdk_r$ANDROID_SDK_VERSION-linux.tgz
RUN mv android-sdk-linux /usr/local/android-sdk

# Install android ndk
RUN wget http://dl.google.com/android/ndk/android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2
RUN tar -xvjf android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2
RUN mv android-ndk-r$ANDROID_NDK_VERSION /usr/local/android-ndk

# Install apache ant
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz
RUN tar -xvzf apache-ant-$ANT_VERSION-bin.tar.gz
RUN mv apache-ant-$ANT_VERSION /usr/local/apache-ant

# Add android tools and platform tools to PATH
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Add ant to PATH
ENV ANT_HOME /usr/local/apache-ant
ENV PATH $PATH:$ANT_HOME/bin

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

# Remove compressed files.
RUN cd /; rm android-sdk_r$ANDROID_SDK_VERSION-linux.tgz && rm android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2 && rm apache-ant-$ANT_VERSION-bin.tar.gz

# Install latest android (19 / 4.4.2) tools and system image.
RUN echo "y" | android update sdk --no-ui --force --filter platform-tools,android-19,build-tools-19.0.1,sysimg-19
