#!/bin/bash
date
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
/usr/local/bin/gunicorn -w 3 --bind unix:/tmp/gamebox-ipc.sock wsgi:app
exit 0