#!/bin/bash
apt update
apt upgrade -y
apt install vlc fbi python3-pip -y
pip3 install flask
echo Done
exit 0
