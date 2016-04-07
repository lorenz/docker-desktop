#!/bin/bash
mkdir /var/run/sshd
rm /etc/ssh/ssh_host_*
sed -i 's|HostKey /etc/ssh/\(.*\)|HostKey /sec/\1|g' /etc/ssh/sshd_config
