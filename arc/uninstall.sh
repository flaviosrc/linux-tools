#!/usr/bin/env bash

set -euo pipefail

echo "Desinstalando Linux Tools..."

rm -f "$HOME/.local/bin/lt-"*
rm -rf "$HOME/.local/lib/linux-tools"

echo "Linux Tools removido com sucesso!"