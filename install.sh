#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/linux-tools"

mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

cp bin/* "$INSTALL_DIR/"

chmod +x "$INSTALL_DIR"/*

cp -n config/* "$CONFIG_DIR/" 2>/dev/null || true

echo "Instalação concluída"
echo "Certifique-se que ~/.local/bin está no PATH"
