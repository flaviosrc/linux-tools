#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git -C "$SCRIPT_DIR" pull

bash "$SCRIPT_DIR/uninstall.sh"

bash "$SCRIPT_DIR/install.sh"
