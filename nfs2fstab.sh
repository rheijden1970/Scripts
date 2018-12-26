#!/bin/bash

#datalines
ip=1.1.1.1
sharefolder="/mnt/lokaal/sdc/sabnzbd/downloads/complete/foldername"
user=richard
foldername=test

#make the folder for the nfs share
mkdir -p /home/$user/$foldername

#sudo cp /etc/fstab /etc/fstab.backup
echo "$ip:$sharefolder /home/$user/$foldername nfs noauto,x-systemd.automount,x-systemd.device-timeout=10,timeo=14,x-systemd.idle-timeout=1min 0 0" | sudo tee -a /home/$user/fstab >/dev/null
