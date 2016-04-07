#!/bin/bash
adduser --disabled-password --gecos "$USER,,," $USER
echo "$USER:$PASSWORD" | chpasswd
adduser $USER sudo
chown -R $USER /var/lib/x2go
if [ ! -f /sec/ssh_host_rsa_key ]; then
	ssh-keygen -A
	mv /etc/ssh/ssh_host_*_key /sec
fi
exec /usr/sbin/sshd -D
