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
