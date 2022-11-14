#!/bin/bash
clear
sudo killall fbi
sleep 1
sudo fbi -a --noverbose -T 1 $1
clear
exit 0
