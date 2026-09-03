#!/bin/bash

read -e -p "key name [id_${USER}_${HOSTNAME}]: " key_name
key_name="${key_name:-id_${USER}_${HOSTNAME}}"

ssh-keygen -t ed25519 -f $HOME/.ssh/$key_name

read -e -p "add to ssh agent? (y/n):" add_to_agent

if [ "$add_to_agent" = "y" ]; then
    ssh-add $HOME/.ssh/$key_name
fi
