#!/bin/bash
clear
sudo killall /usr/bin/fbi
sleep 1
sudo /usr/bin/fbi -a --noverbose -T 1 $1
clear
exit 0
