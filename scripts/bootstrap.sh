#!/bin/bash
set -e
apt update
apt upgrade -y
apt install build-essential cmake git python3-pip nginx fbi bc libjpeg-dev glances avahi-daemon -y
pip3 install flask gunicorn bottle
pushd /opt/
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git
pushd /opt/libjpeg-turbo
make && make deb && dpkg -i `ls libjpeg-turbo*.deb`
echo sleep 5 > /var/lib/dietpi/dietpi-autostart/custom.sh
echo cd /opt/gamebox-server >> /var/lib/dietpi/dietpi-autostart/custom.sh
echo /opt/gamebox-server/scripts/init.sh >> /var/lib/dietpi/dietpi-autostart/custom.sh
echo exit 0 >> /var/lib/dietpi/dietpi-autostart/custom.sh
chmod +x /var/lib/dietpi/dietpi-autostart/custom.sh
pushd /etc/nginx
ln -s /opt/gamebox-server/sites-available ./sites-enabled
nginx -t
popd ; popd ; popd ; reboot