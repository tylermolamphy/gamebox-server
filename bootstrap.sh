#!/bin/bash
apt update
apt upgrade -y
apt install vlc fbi nginx python3-pip inotify-tools  -y
pip3 install flask gunicorn
curl -L https://bit.ly/glances | /bin/bash
reboot
exit 0
