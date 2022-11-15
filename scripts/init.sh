#!/bin/bash
date
whoami
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
/usr/local/bin/gunicorn -w 2 --bind unix:/tmp/gamebox-ipc.sock wsgi:app &disown
while true
do sleep 30
echo "Check for updates..."
git pull --force | grep "Fast-forward" || halt -r
done