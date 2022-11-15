#!/bin/bash
date
whoami
pushd /opt/gamebox-server
git config pull.ff only
git fetch
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
/usr/local/bin/gunicorn -w 2 --bind unix:/tmp/gamebox-ipc.sock wsgi:app &disown
inotifywait -m /opt/gamebox-server/ -e create -e modify -e moved_to | halt --reboot
exit 0