FROM ubuntu:18.04
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV DOCKER_DIR="/data/docker"
ENV ANSIBLE_DIR=$DOCKER_DIR"/ansible"
ENV PLAYBOOK_DIR=$ANSIBLE_DIR"/playbooks"

ENV NOTVISIBLE "in users profile"

RUN apt-get update \
 && apt-get -y upgrade \
 && mkdir -p $DOCKER_DIR \
 && apt-get install -y ansible openssh-server \
 && mkdir /var/run/sshd \
 && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
 && echo "root:docker" | chpasswd \
 && ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa \
 && echo "" > /root/.ssh/authorized_keys

RUN echo "export VISIBLE=now" >> /etc/profile

ADD ansible $ANSIBLE_DIR
RUN ansible-galaxy install -r $DOCKER_DIR/ansible/requirements.yml
RUN ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/core.yml

ONBUILD COPY ansible $ANSIBLE_DIR
ONBUILD RUN [ -f "$DOCKER_DIR/ansible/custom_requirements.yml" ] && ansible-galaxy install -r $DOCKER_DIR/ansible/custom_requirements.yml
ONBUILD RUN ansible-playbook -i $ANSIBLE_DIR/inventory $PLAYBOOK_DIR/setup.yml
ONBUILD ADD entrypoint.sh /entrypoint.sh
ONBUILD RUN chmod +x /entrypoint.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT ["/entrypoint.sh"]
