#!/bin/bash
/usr/bin/clear
if [ $# -eq 0 ]
  then
    /usr/bin/sudo /usr/bin/killall /usr/bin/fbi
    /usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/uploaded_images/$(/usr/bin/ls -t /opt/uploaded_images/ | /usr/bin/head -1)
    exit 0
fi
/usr/bin/sudo /usr/bin/killall /usr/bin/fbi
/usr/bin/sleep 1
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 $1
exit 0
