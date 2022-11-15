#!/bin/bash
date
chown -R flask:www-data /opt/gamebox-server/
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
chown -R flask:www-data /opt/gamebox-server/
/usr/bin/sudo /usr/bin/fbi -a --noverbose -T 1 /opt/landing.jpg
exit 0
