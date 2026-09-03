#!/bin/bash

ls -la $HOME/.ssh/*.pub

read -e -p "public key name (ex. id_${USER}_${HOSTNAME}.pub): " pub_key_name

read -e -p "remote server (ex. -p 22022 user@hostname): " remote_server

ssh-copy-id -i $HOME/.ssh/$pub_key_name $remote_server
