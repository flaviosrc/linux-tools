#!/usr/bin/env bash

set -euo pipefail

echo "Desinstalando Linux Tools..."

rm "$HOME/.local/bin/lt-"*
rm -r "$HOME/.local/lib/linux-tools"
rm -r "$HOME/.config/linux-tools"

echo "Linux Tools removido com sucesso!"