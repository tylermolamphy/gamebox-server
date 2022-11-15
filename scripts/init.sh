#!/bin/bash
date
whoami
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
/usr/local/bin/gunicorn -w 2 --bind unix:/tmp/gamebox-ipc.sock wsgi:app &disown
while inotifywait -mre create,delete,modify /opt/gamebox-server ; do
    sudo /sbin/reboot
done
exit 0