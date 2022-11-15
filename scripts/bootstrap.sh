#!/bin/bash
apt update
apt upgrade -y
apt install fbi libjpeg-dev python3-pip glances -y
pip3 install flask gunicorn bottle
reboot