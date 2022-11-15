#!/bin/bash
apt update
apt upgrade -y
apt install fbi libjpeg-dev python3-pip -y
pip3 install flask gunicorn
reboot
exit 0