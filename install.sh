#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"
LIB_DIR="$HOME/.local/lib/linux-tools"
CONFIG_DIR="$HOME/.config/linux-tools"

mkdir -p "$INSTALL_DIR" "$LIB_DIR" "$CONFIG_DIR"

cp "$SCRIPT_DIR"/bin/* "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR"/lt-*

cp "$SCRIPT_DIR"/lib/* "$LIB_DIR/"
cp -n "$SCRIPT_DIR"/config/* "$CONFIG_DIR/" 2>/dev/null || true

echo "Instalação concluída"
echo "Certifique-se que ~/.local/bin está no PATH"
echo "$ echo \"PATH=\$PATH:\$HOME/.local/bin\" >> ~/.bashrc"
