#!/bin/bash
/usr/bin/clear
upSeconds="$(cat /proc/uptime | grep -o '^[0-9]\+')"
upMins=$((${upSeconds} / 60))
if [ $# -eq 0 ]
  then
    /usr/bin/sudo /usr/bin/killall /usr/bin/fbi
    /usr/bin/sudo /usr/bin/fbi -a --fitwidth --noverbose -T 1 /opt/uploaded_images/$(/usr/bin/ls -t /opt/uploaded_images/ | /usr/bin/head -1)
    exit 0
fi
/usr/bin/sudo /usr/bin/killall /usr/bin/fbi
if [ "${upMins}" -lt "1" ]
then
    sleep 30
    /usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
fi
/usr/bin/sudo /usr/bin/fbi -a --fitwidth --noverbose -T 1 $1
exit 0
