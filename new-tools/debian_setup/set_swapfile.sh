#!/bin/bash -x

dd if=/dev/zero of=/swapfile bs=1M count=8192 status=progress

chmod 600 /swapfile

mkswap /swapfile

swapon /swapfile

echo "/swapfile none swap sw 0 0" >> /etc/fstab

swapon --show

free -h 
