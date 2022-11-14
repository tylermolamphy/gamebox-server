#!/bin/bash
apt update
apt upgrade -y
apt install vlc fbi nginx python3-pip  -y
pip3 install flask gunicorn
echo Done
exit 0
