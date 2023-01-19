#!/bin/bash
if [ x$1 == x"precustomization" ]; then
echo Do Precustomization tasks
elif [ x$1 == x"postcustomization" ]; then
hostnamectl set-hostname ${custom_hostname}
cd /root/deploy
/bin/sh /root/deploy/deploy.sh -r ${custom_region} -u ${custom_users} ${custom_zabbix}
${custom_make_lvm}
init 6
fi
#simple example of customization script