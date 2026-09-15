#!/bin/bash

ls -la $HOME/.ssh/*.pub

read -e -p "public key (ex. id_ed25519.pub): " pub_key_name

read -e -p "host connection (ex. -p 2222 user@hostname): " host

ssh-copy-id -i $HOME/.ssh/$pub_key_name $host
