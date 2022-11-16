#!/bin/bash
apt update
apt upgrade -y
apt install fbi libjpeg-dev python3-pip glances -y
pip3 install flask gunicorn bottle
pushd /opt/
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git
pushd /opt/libjpeg-turbo
make
make deb
exit 0
popd
popd
reboot