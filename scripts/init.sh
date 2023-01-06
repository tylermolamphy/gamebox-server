#!/bin/bash
date
whoami
updatestatline() {
uptime --pretty > /var/log/systemuptime.log
git rev-parse --short HEAD > /var/log/gameboxcommit.log
df -h  | grep \/root | awk {'print $5'} > /var/log/spaceused.log
temp=`/usr/bin/vcgencmd measure_temp | awk -F "[=']" {'print $2'} | cut -c 1-2`
if (( $temp >= 70 ))
then
    temp="$temp°C: Warning, potential for damage at this temperature!"

elif (( $temp >= 65 ))
then
    temp="$temp°C: Running hot, something is wrong"

elif (( $temp >= 60 ))
then
    temp="$temp°C (warm)"

elif (( $temp >=25 ))
then
    temp="$temp°C"

elif (( $temp >= 10 ))
then
    temp="$temp°C: Suspiciously cool?"
else
    temp="OUT OF RANGE: $temp°C: Something is very, very wrong"
fi
echo $temp > /var/log/systemtemp.log
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