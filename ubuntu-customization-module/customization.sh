#!/bin/bash
if [ x$1 == x"precustomization" ]; then
echo Do Precustomization tasks
elif [ x$1 == x"postcustomization" ]; then
hostnamectl set-hostname ${custom_hostname}
fi 