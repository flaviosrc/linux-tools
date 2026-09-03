#!/bin/bash

echo ""
echo "Lista de chaves em $HOME/.ssh:"

echo ""
ls -la $HOME/.ssh

echo ""
echo "Nome da chave pública (ex. cert_key.pub):" 
read -e pub_cert_name

echo ""
echo "Servidor remoto (ex. -p 22022 usuario@servidor):"
read -e remote_server

echo ""
ssh-copy-id -i $HOME/.ssh/$pub_cert_name $remote_server
