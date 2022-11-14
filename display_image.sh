#!/bin/bash
clear
if [ $# -eq 0 ]
  then
    1 = $(ls -t /opt/uploaded_images/ | head -1)
fi
sudo killall /usr/bin/fbi
sleep 1
sudo /usr/bin/fbi -a --noverbose -T 1 $1
clear
exit 0
