#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR="$HOME/.local/bin"
LIB_DIR="$HOME/.local/lib/linux-tools"
CONFIG_DIR="$HOME/.config/linux-tools"

read -p "Local de instalação do Linux Tools (padrão: $HOME/.linux-tools): " install_dir
install_dir="${install_dir:-$HOME/.linux-tools}"

git status $install_dir >/dev/null 2>&1 || git clone https://github.com/flaviosrc/linux-tools.git $install_dir

cd $install_dir

mkdir -p "$INSTALL_DIR"
mkdir -p "$LIB_DIR"
mkdir -p "$CONFIG_DIR"

cp bin/* "$INSTALL_DIR/"

chmod +x "$INSTALL_DIR"/*

cp lib/* "$LIB_DIR/"

cp -n config/* "$CONFIG_DIR/" 2>/dev/null || true

echo "Instalação concluída"
echo "Certifique-se que ~/.local/bin está no PATH"
echo "$ echo "PATH=\$PATH:\$HOME/.local/bin" >> ~/.bashrc"