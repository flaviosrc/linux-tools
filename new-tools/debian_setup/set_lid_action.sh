#!/bin/bash -x

echo "
change all HandleLidSwitch params in /etc/systemd/logind.conf
then reload systemd-logind.service
systemctl reload systemd-logind.service
systemctl daemon-reload
"


