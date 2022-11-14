#!/bin/bash
/usr/bin/clear
if [ $# -eq 0 ]
  then
    sudo /usr/bin/killall /usr/bin/fbi
    sudo /usr/bin/fbi -a --noverbose -T 1 /opt/uploaded_images/$(ls -t /opt/uploaded_images/ | head -1)
    exit 0
fi
sudo /usr/bin/killall /usr/bin/fbi
/usr/bin/sleep 1
sudo /usr/bin/fbi -a --noverbose -T 1 $1
exit 0
