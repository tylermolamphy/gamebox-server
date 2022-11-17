#!/bin/bash
date
whoami
updatestatline() {
uptime --pretty > /var/log/systemuptime.log
git rev-parse --short HEAD > /var/log/gameboxcommit.log
df -h  | grep \/root | awk {'print $5'} > /var/log/spaceused.log
temp=`/usr/bin/vcgencmd measure_temp | awk -F "[=']" {'print $2'} | cut -c 1-2`
temp_f=`echo "scale=4; $temp*1.8 + 32" | bc`
if (( $temp >= 70 ))
then
    temp="<p class="text-danger">WARNING: $temp °C / $temp_f °F : Reducing the life of your device</p>"

elif (( $temp >= 60 ))
then
    temp="<p class="text-warning">$temp °C / $temp_f °F: Running hot, not recommended</p>"

elif (( $temp >= 50 ))
then
    temp="<p class="text-light">$temp °C / $temp_f °F: Running warm, but safe</p>"

elif (( $temp >= 40 ))
then
    temp="<p class="text-light">$temp °C / $temp_f °F: Optimal temperature</p>"

elif (( $temp >= 30 ))
then
    temp="<p class="text-info">$temp °C / $temp_f °F: Suspiciously cool</p>"
else
    temp="<p class="text-danger">OUT OF RANGE: $temp °C / $temp_f °F: Something is very, very wrong</p>"
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