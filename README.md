# linux-tools

A personal Unix toolbox for Linux professionals. One command to set up any machine — bare metal, Docker, or Kubernetes — exactly the way you want it.

Built on the Unix philosophy: each tool does one thing, all tools compose well, and less code is always better.

---

## Install

```bash
bash install.sh
```

Config files are never overwritten — your changes are preserved on updates.

```bash
bash update.sh    # pull latest + reinstall
bash uninstall.sh # remove everything
```

---

## Tools

All tools are interactive — just run and follow the prompts.

### GPG
| Command | Description |
|---|---|
| `lt-gpg-generate-private` | Generate a new GPG key |
| `lt-gpg-import-private-key` | Import a GPG private key |
| `lt-gpg-export-public-key` | Export a GPG public key |
| `lt-gpg-export-private-key` | Export a GPG private key |

### Git
| Command | Description |
|---|---|
| `lt-git-config-global` | Set global Git identity and defaults |
| `lt-git-config-repository` | Set per-repository Git identity and optional GPG signing |
| `lt-git-config-ssh-key` | Set a specific SSH key for the current repository |

### SSH
| Command | Description |
|---|---|
| `lt-ssh-add-temporary-private-key` | Load a key into the agent with a 1-hour TTL |
| `lt-ssh-add-permanent-private-key` | Add a permanent key with a `~/.ssh/config` entry (Host alias or Match Host+User) |

### Backup
| Command | Description |
|---|---|
| `lt-backup-secure-copy` | Copy files with SHA256 integrity verification via rsync |
| `lt-backup-snapshot` | Incremental rsync snapshots with hardlinks, atomic rename, and 30-day retention |

### Vault
| Command | Description |
|---|---|
| `lt-vault-create` | Create a LUKS-encrypted virtual disk vault |
| `lt-vault-open` | Decrypt and mount a vault |
| `lt-vault-close` | Unmount and close a vault |

### System
| Command | Description |
|---|---|
| `lt-user-add` | Create deploy user and add to docker group |
| `lt-swap-increace` | Create and enable an 8GB swapfile |
| `lt-mount-media` | Remount Ventoy USB as root at `/media/root/Ventoy` |
| `lt-systemctl-restart-bridge` | Restart br0 bridge interface and NetworkManager |

---

## Guides

Guide scripts print reference content when executed — no side effects, no prompts.

### Debian Setup
| Command | Description |
|---|---|
| `lt-guide-debian-bridge` | Configure bridge network interface (br0) |
| `lt-guide-debian-clipboard` | Enable clipboard sharing via SPICE (KVM/QEMU) |
| `lt-guide-debian-hibernation` | Configure hibernation with swapfile on encrypted root |
| `lt-guide-debian-lid-action` | Configure laptop lid close action via logind.conf |
| `lt-guide-debian-nic-router` | Route a subnet with DHCP/DNS via GNOME Network settings |
| `lt-guide-debian-sudoer` | Add user to sudo group |
| `lt-guide-debian-timezone` | Set timezone with timedatectl |

### Linux
| Command | Description |
|---|---|
| `lt-guide-linux-background-jobs` | Background job management (jobs, disown, bg, Ctrl+Z) |
| `lt-guide-linux-backup` | Full system backup with rsync |
| `lt-guide-linux-cli` | Linux CLI quick reference |
| `lt-guide-linux-mount` | Mount regular and LUKS-encrypted disks |
| `lt-guide-linux-partitioning` | GPT, UEFI, swap, and full-disk encryption notes |
| `lt-guide-linux-permissions` | chmod reference (octal values, notation) |
| `lt-guide-linux-reset-password` | Reset password via GRUB recovery mode |
| `lt-guide-linux-rpm` | RPM package tools (rpm2cpio, listing files) |
| `lt-guide-linux-samba` | Samba file sharing configuration |
| `lt-guide-linux-screen` | screen session management |
| `lt-guide-linux-ssh-keygen` | SSH key generation and agent setup |
| `lt-guide-linux-swap` | ZRAM swap configuration (Fedora) |
| `lt-guide-encrypted-volume` | Create LUKS encrypted volume with key file and auto-mount |

### Development
| Command | Description |
|---|---|
| `lt-guide-dev-build-start` | Build and start Java/Node development environment |
| `lt-guide-dev-common-errors` | Common development errors and solutions |
| `lt-guide-dev-docker` | Docker tips for running database containers |
| `lt-guide-dev-sonarqube` | SonarQube Maven analysis setup |
| `lt-guide-dev-vscode` | VS Code extensions and workspace commands |
| `lt-guide-vsc-git-gutter` | VS Code git gutter troubleshooting |

### Windows
| Command | Description |
|---|---|
| `lt-guide-win-activation` | Windows 10 activation via KMS |
| `lt-guide-win-ping-map` | PowerShell subnet ping scanner |
| `lt-guide-win-sig-verify` | Verify executable digital signature |

### Security
| Command | Description |
|---|---|
| `lt-guide-wifi-audit` | wifite WPA dictionary attack guide |

### Reference
| Command | Description |
|---|---|
| `lt-ref-debian-archive` | Link to Debian archive CD images |
