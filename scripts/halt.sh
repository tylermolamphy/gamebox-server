#!/bin/bash
if [ $# -eq 0 ]
  then
    /sbin/poweroff
fi
if [ $1 -eq "s" ]
  then
    /sbin/poweroff
fi
if [ $1 -eq "r" ]
  then
    /sbin/reboot
fi
exit 1