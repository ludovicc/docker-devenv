FROM internal_registry:5000/java7

USER root

ENV ANDROID_SDK_VERSION 22.6.2
ENV ANDROID_NDK_VERSION 9d
ENV ANDROID_SYSIMG_VERSION 19
ENV ANDROID_BUILD_TOOLS_VERSION 19.0.3
ENV ANT_VERSION 1.9.4

# Install android sdk
RUN wget http://dl.google.com/android/android-sdk_r$ANDROID_SDK_VERSION-linux.tgz && \
    tar -xvzf android-sdk_r$ANDROID_SDK_VERSION-linux.tgz && \
    mv android-sdk-linux /usr/local/android-sdk && \
    rm android-sdk_r$ANDROID_SDK_VERSION-linux.tgz

# Install android ndk
RUN wget http://dl.google.com/android/ndk/android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2 && \
    tar -xvjf android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2 && \
    mv android-ndk-r$ANDROID_NDK_VERSION /usr/local/android-ndk && \
    rm android-ndk-r$ANDROID_NDK_VERSION-linux-x86_64.tar.bz2

# Install apache ant
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz && \
    tar -xvzf apache-ant-$ANT_VERSION-bin.tar.gz && \
    mv apache-ant-$ANT_VERSION /usr/local/apache-ant && \
    rm apache-ant-$ANT_VERSION-bin.tar.gz

# Add android tools and platform tools to PATH
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Add ant to PATH
ENV ANT_HOME /usr/local/apache-ant
ENV PATH $PATH:$ANT_HOME/bin

# Install latest android (19 / 4.4.2) tools and system image.
RUN echo "y" | android update sdk --no-ui --force --filter platform-tools,android-$ANDROID_SYSIMG_VERSION,build-tools-$ANDROID_BUILD_TOOLS_VERSION,sysimg-ANDROID_SYSIMG_VERSION

# Clean up APT when done.
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*
