FROM internal_registry:5000/android

# add nodejs to install cordova (code from https://index.docker.io/u/dockerfile/nodejs/)
RUN add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get update && \
    apt-get install -y nodejs

# Append to $PATH variable.
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile


# install cordova
RUN npm install -g cordova

VOLUME /workspace
WORKDIR /workspace