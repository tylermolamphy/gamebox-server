#!/bin/bash
date
whoami
updatestatline() {
uptime --pretty > /var/log/systemuptime.log
/usr/bin/vcgencmd measure_temp | awk -F "[=']" {'print "SOC temp " $2 " °C"'} > /var/log/systemtemp.log
git rev-parse --short HEAD > /var/log/gameboxcommit.log
df -h  | grep \/root | awk {'print $5'} > /var/log/spaceused.log
}
updatestatline
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
/usr/local/bin/gunicorn -w 2 --bind unix:/tmp/gamebox-ipc.sock wsgi:app &disown
while true
do sleep 60
updatestatline ; git pull --force | grep Updating && /sbin/reboot
done