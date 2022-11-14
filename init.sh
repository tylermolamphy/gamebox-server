#!/bin/bash
pushd /opt/gamebox-server
git config pull.ff only
git pull --force
popd
sudo systemctl restart flask
echo Ready
exit 0
