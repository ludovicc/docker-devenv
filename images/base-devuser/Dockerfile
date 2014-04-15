FROM internal_registry:5000/base

# create a developer user
RUN useradd -m -p $(perl -e'print crypt("devpwd", "aa")') developer && \
    adduser developer sudo

USER developer
