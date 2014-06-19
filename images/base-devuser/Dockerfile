FROM internal_registry:5000/base

EXPORT TERM linux

RUN echo "byobu byobu/launch-by-default boolean true" | debconf-set-selections && \
    dpkg-reconfigure -phigh byobu

# create a developer user
RUN useradd -m -p $(perl -e'print crypt("devpwd", "aa")') developer && \
    adduser developer sudo

ADD .inputrc /home/developer/.inputrc 
RUN git clone https://github.com/revans/bash-it.git /home/developer/.bash_it
    chown -R developer:developer /home/developer
EXPORT HOME /home/developer
EXPORT WORK_DIR /home/developer/Projects
# Switch to the developer user when the container is ready to start
USER developer
