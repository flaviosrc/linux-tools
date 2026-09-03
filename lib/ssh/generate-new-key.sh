#!/bin/bash

set -e

echo ""
echo "Nome do novo certificado (ex. cert_key):"
read -e cert_name

echo ""
ssh-keygen -t ed25519 -f $HOME/.ssh/$cert_name

chmod 600 $HOME/.ssh/$cert_name