#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "[WARN] este script deve ser executado como root!"
    exit 1
fi

echo "[INFO] instalando programa de backup em /usr/local/bin"

cp backup_snapshot_sre.sh /usr/local/bin/.

chmod +x /usr/local/bin/backup_snapshot_sre.sh

echo "[INFO] criando cron se não existir"

crontab -l 2>/dev/null | grep -F "backup_snapshot_sre.sh" || (crontab -l 2>/dev/null; echo "*/15 * * * * /usr/local/bin/backup_snapshot_sre.sh") | crontab -

crontab -l