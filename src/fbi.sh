#!/bin/sh
killall fbi
sleep 1
sudo fbi -a --noverbose -T 1 /home/t/image.jpg
exit 0