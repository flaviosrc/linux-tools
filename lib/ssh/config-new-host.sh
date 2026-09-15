#!/bin/bash

read -e -p "HostName (ex: github.com): " host_name

read -e -p "Host [${host_name}]: " host_alias
host_alias="${host_alias:-$host_name}"

read -e -p "User (ex: git): " user

read -e -p "Port [22]: " port
port="${port:-22}"

ls -la --ignore='*.pub' ~/.ssh
read -e -p "IdentityFile (ex. id_ed25519): " private_key
private_key="~/.ssh/$private_key"

new_config="Host $host_alias
	HostName $host_name
	User $user
	Port $port
	IdentityFile $private_key"

echo "------------- current hosts -------------"
cat ~/.ssh/config

echo "------------- new host -------------"
echo "$new_config"

read -e -p "apply? (y/n) " confirm
if [ "$confirm" != "y" ]; then
	echo "canceled!"
else
	echo "appling!"
	touch ~/.ssh/config
	echo "$new_config" >> ~/.ssh/config
fi

exit 0
