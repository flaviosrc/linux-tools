#!/usr/bin/env bash

set -euo pipefail

read -p "Local de instalação do Linux Tools (padrão: $HOME/.linux-tools): " install_dir
install_dir="${install_dir:-$HOME/.linux-tools}"

cd $install_dir

git pull

bash install.sh
