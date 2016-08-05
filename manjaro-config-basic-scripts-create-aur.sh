#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

if [ "X${AUR_HOME}" == "X" ]; then
  export AUR_HOME=/var/aur
fi

useradd -r -s /bin/bash -d "${AUR_HOME}" aur
echo "enter new password for user aur twice:"
passwd aur
mkdir "${AUR_HOME}"
chown aur "${AUR_HOME}"
cp /usr/share/manjaro-config-basic-scripts/bashrc-aur "${AUR_HOME}"/.bashrc
chown aur "${AUR_HOME}"/.bashrc
chmod 644 "${AUR_HOME}"/.bashrc
echo "aur      ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers
