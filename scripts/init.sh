#!/bin/bash
date
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
inotifywait -m /opt/gamebox-server -e create -e modify -e moved_to |
    while read path action file; do
        sudo reboot
    done
/usr/local/bin/gunicorn -w 2 --bind unix:/tmp/gamebox-ipc.sock wsgi:app
exit 0