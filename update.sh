#!/usr/bin/env bash

set -e

REPO_DIR="$HOME/.linux-tools"

cd "$REPO_DIR"

git pull

bash install.sh
