#!/bin/sh
 
SERVICE='fbi'
while true; do
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo "running" # >> /dev/null
else
sudo fbi -a --noverbose -T 1 /home/t/image.jpg & 
fi
done