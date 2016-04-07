FROM ubuntu:xenial-20160331.1

# X2go and ssh
RUN apt-get update && apt-get -yy install software-properties-common && add-apt-repository ppa:x2go/stable && apt-get update && apt-get -yy install x2goserver x2goserver-xsession mate-desktop-environment-core openssh-server

# Design
RUN apt-get install -yy light-themes fonts-inconsolata fonts-lato

EXPOSE 22
VOLUME /sec /home
ADD run.sh /run.sh
CMD ["/run.sh"]

RUN mkdir /var/run/sshd && rm /etc/ssh/ssh_host_* && sed -i 's|HostKey /etc/ssh/\(.*\)|HostKey /sec/\1|g' /etc/ssh/sshd_config
