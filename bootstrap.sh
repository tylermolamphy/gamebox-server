#!/bin/bash
apt update
apt upgrade -y
apt install fbi python3-pip inotify-tools  -y
pip3 install flask gunicorn
reboot
exit 0