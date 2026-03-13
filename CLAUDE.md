# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Philosophy

`linux-tools` is a personal, non-commercial Unix-like toolbox for Linux professionals. The core rule: **less complexity and fewer lines of code is always better.** Follow the Unix philosophy — each tool does one thing well, scripts are composable, and simplicity is the design goal.

The target user is a Linux professional who needs to quickly set up development or production environments (bare metal, Docker, Kubernetes) on any Linux machine by installing this single toolkit.

Planned tool categories include: Git config, GPG keys, SSH keys, SSH server setup, backup routines, monitoring tools, and Telegram alert notifications.

## Installation & Lifecycle

```bash
bash install.sh     # copies bin/* → ~/.local/bin, lib/* → ~/.local/lib/linux-tools, config/* → ~/.config/linux-tools
bash update.sh      # git pull + re-runs install.sh
bash uninstall.sh   # removes all lt-* binaries and installed lib/config dirs
```

`install.sh` uses `cp -n` for config files to preserve user-modified configs.

## Project Structure

- `bin/` — executable scripts, prefixed `lt-`, installed to `~/.local/bin/`
- `lib/logging.sh` — shared library with `log_info()` and `log_error()`
- `config/` — default config templates installed to `~/.config/linux-tools/` (non-destructively)

## Script Conventions

- Shebang: `#!/bin/bash` for `bin/` scripts; `#!/usr/bin/env bash` for lifecycle scripts (`install.sh`, etc.)
- Lifecycle scripts use `set -euo pipefail`; bin scripts generally do not
- Scripts are interactive — use `read` to prompt the user, not CLI argument parsing
- Naming: `lt-<tool>-<action>` (e.g., `lt-gpg-export-public-key`, `lt-ssh-add-temporary-private-key`)
- Source shared lib at runtime path: `$HOME/.local/lib/linux-tools/logging.sh`

## Current Tool Categories

- **GPG**: generate, import, export (public/private) keys for Git commit signing
- **Git**: global defaults and per-repository identity + optional GPG signing
- **SSH**: temporary keys (1h TTL via `ssh-add -t 1h`) and permanent keys with `~/.ssh/config` entries
