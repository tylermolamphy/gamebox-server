#!/bin/bash
if [[ ! -n $1 ]];
then 
    /sbin/poweroff
else
    /sbin/reboot
fi
exit 1