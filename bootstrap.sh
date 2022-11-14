#!/bin/bash
apt update
apt upgrade -y
apt install vlc fbi python-pip -y
pip install flask
echo Done
exit 0
