# Build:
#   docker build -t gostint-ansible .

FROM jmal98/ansiblecm:2.7.5

COPY dump.yml /tmp/playbook/

ENV ANSIBLE_SSH_ARGS='-o StrictHostKeyChecking=no'

RUN \
  pip install hvac hashivault-vars==0.1.13 && \
  ln -s /usr/lib/python2.7/site-packages/hashivault_vars/hashivault_vars.py \
    /usr/lib/python2.7/site-packages/ansible/plugins/vars
