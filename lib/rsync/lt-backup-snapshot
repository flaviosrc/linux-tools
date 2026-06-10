#!/bin/bash

############################################
# CONFIG
############################################

UUID_BACKUP="3243905f-2555-4105-b0d4-c5ca85acd481"   # <-- TROQUE PELO SEU
MOUNTPOINT="/mnt/backup"
ORIGEM="/mnt/storage/"
BASE="$MOUNTPOINT/snapshots"
LOG="/var/log/backup_snapshot.log"

RETENCAO_DIAS=30
MIN_FREE_GB=10

LOCKFILE="/var/run/backup_snapshot.lock"

############################################

exec 9>"$LOCKFILE"
flock -n 9 || exit 0

log(){
    echo "$(date '+%F %T') - $1" >> "$LOG"
}

# Rotação log simples
if [ -f "$LOG" ]; then
    SIZE=$(du -m "$LOG" | cut -f1)
    [ "$SIZE" -gt 20 ] && mv "$LOG" "$LOG.old"
fi

############################################
# VALIDAR UUID DO DISCO
############################################

UUID_ATUAL=$(findmnt -n -o UUID --target "$MOUNTPOINT")

if [ "$UUID_ATUAL" != "$UUID_BACKUP" ]; then
    log "UUID incorreto ou disco errado montado ($UUID_ATUAL)"
    exit 2
fi

############################################
# VALIDAR MOUNT
############################################

if ! mountpoint -q "$MOUNTPOINT"; then
    log "Disco não montado"
    exit 3
fi

############################################
# VALIDAR ESPAÇO
############################################

FREE=$(df -BG "$MOUNTPOINT" | awk 'NR==2 {gsub("G","",$4); print $4}')

if [ "$FREE" -lt "$MIN_FREE_GB" ]; then
    log "Espaço insuficiente (${FREE}GB)"
    exit 4
fi

############################################
# PREPARAR SNAPSHOT ATÔMICO
############################################

DATA=$(date '+%Fh%T')
DESTINO_FINAL="$BASE/$DATA"
DESTINO_TMP="$BASE/.${DATA}.incomplete"

mkdir -p "$BASE"

if [ -d "$DESTINO_FINAL" ]; then
    log "Snapshot já existe ($DATA)"
    exit 0
fi

ULTIMO=$(ls -1 "$BASE" 2>/dev/null | grep -v incomplete | sort | tail -n 1)

if [ -n "$ULTIMO" ]; then
    LINKDEST="--link-dest=$BASE/$ULTIMO"
    log "Base incremental: $ULTIMO"
else
    LINKDEST=""
    log "Primeiro snapshot FULL"
fi

############################################
# RSYNC HARDENED
############################################

log "Iniciando rsync snapshot $DATA"

nice -n 19 ionice -c2 -n7 timeout 24h rsync -a --delete-delay --numeric-ids --partial --partial-dir=.rsync-partial --info=stats2,progress2 $LINKDEST "$ORIGEM" "$DESTINO_TMP" >> "$LOG" 2>&1 &

RSYNC_PID=$!

############################################
# MONITORAR DESMONTAGEM DURANTE BACKUP
############################################

while kill -0 $RSYNC_PID 2>/dev/null; do
    sleep 15
    if ! mountpoint -q "$MOUNTPOINT"; then
        log "Disco desmontado durante backup! Abortando."
        kill -9 $RSYNC_PID
        exit 5
    fi
done

wait $RSYNC_PID
RET=$?

if [ "$RET" -ne 0 ]; then
    log "Erro rsync código $RET"
    exit 6
fi

############################################
# SNAPSHOT ATÔMICO (RENAME FINAL)
############################################

mv "$DESTINO_TMP" "$DESTINO_FINAL"

log "Snapshot concluído $DATA"

############################################
# RETENÇÃO AUTOMÁTICA
############################################

log "Aplicando retenção ${RETENCAO_DIAS} dias"

ls -1 "$BASE" | grep -v incomplete | sort | head -n -$RETENCAO_DIAS | while read OLD; do
    log "Removendo $OLD"
    rm -rf "$BASE/$OLD"
done

log "Finalizado OK"
exit 0
