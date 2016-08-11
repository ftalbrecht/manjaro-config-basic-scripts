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

echo "aur      ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

mkdir "${AUR_HOME}" && chown aur "${AUR_HOME}"

cp /usr/share/manjaro-config-basic-scripts/bashrc-aur "${AUR_HOME}"/.bashrc
chown aur "${AUR_HOME}"/.bashrc
chmod 644 "${AUR_HOME}"/.bashrc

su aur -c 'git config --global user.name aur@manjaro && git config --global user.email aur@manjaro && git config --global color.branch auto && git config --global color.diff auto && git config --global color.interactive auto && git config --global color.status auto && git config --global color.ui true && git config --global push.default simple'

cp /usr/share/manjaro-config-basic-scripts/vimrc "${AUR_HOME}"/.vimrc
chown aur "${AUR_HOME}"/.vimrc
chmod 644 "${AUR_HOME}"/.vimrc
su aur -c 'cd && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim -c ":BundleInstall"'
