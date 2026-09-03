#!/bin/bash

echo "
Crontab entry example:

    0 1 * * * rsync -avzL -e \"ssh -i $HOME/.ssh/cert_key -o StrictHostKeyChecking=accept-new\" \"user@hostname:/origin/path\" \"/destination/path\"

Explanation:
    0 1 * * *: execute every day at 01:00AM
    rsync:
        -a: preseve all metadata
        -v: verbose for debug
        -z: compress for less network trafic
        -L: follow symlinks
    ssh:
        -i $HOME/.ssh/cert_key: private key path
        -o StrictHostKeyChecking=accept-new: no prompt to new host, deny strange hosts

ATTENTION!!!

change $HOME/.ssh/cert_key
change user@hostname
change /origin/path and /destination/path

finally, add your custom command to crontab:

    crontab -e
"