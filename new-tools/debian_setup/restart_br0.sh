#!/bin/bash -x

systemctl restart NetworkManager
ip link set br0 down
ip link set br0 up
