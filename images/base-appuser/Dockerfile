FROM internal_registry:5000/base

# install user
RUN useradd -m -G root,adm,www-data,staff --home /home/appuser --shell /bin/zsh appuser
RUN echo "appuser:appuser" | chpasswd
RUN chmod 755 /home/appuser -R
RUN echo "appuser ALL=(ALL) ALL" > /etc/sudoers
