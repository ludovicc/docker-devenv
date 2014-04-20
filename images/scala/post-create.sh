#! /bin/sh

sudo docker run -i -t --cidfile=scala.cid --volumes-from=JARS_CACHE internal_registry:5000/scala /bin/bash -c "chown -R developer:developer /home/developer"
sudo docker commit --author="Ansible" --message="Set home directory ownership" $(cat scala.cid) internal_registry:5000/scala
sudo rm -f scala.cid
