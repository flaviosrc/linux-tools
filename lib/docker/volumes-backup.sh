#!/bin/bash
set -euo pipefail

APP_NAME="docker-volumes-backup"

WORKSPACE="${1:-}"
BACKUP_STORAGE="${2:-}"
BACKUP_MAX_AGE="${3:-7200}"
CURRENT_REPOSITORY=""

LOG_DIR="${HOME}/.local/share/${APP_NAME}/logs"
LOG_RETENTION_DAYS="${LOG_RETENTION_DAYS:-7}"
LOG_FILE="${LOG_DIR}/${APP_NAME}_$(date +%F).log"

_log_init() {
    mkdir -p "$LOG_DIR" || return 0
    touch "$LOG_FILE" || return 0
}

_log_retention() {
    find "$LOG_DIR" -maxdepth 1 -type f -name "${APP_NAME}_*.log" \
        -mtime +"$LOG_RETENTION_DAYS" -print -delete || return 0
}

_log() {
    _lvl="$1"; shift
    _line="$(date '+%F %T') [${_lvl}] $*"
    printf '%s\n' "$_line" | tee -a "$LOG_FILE" 2>/dev/null || true
}

log_info() { _log INFO  "$@"; }
log_warn() { _log WARN  "$@"; }
log_error() { _log log_ERROR "$@"; }

_log_init

validate_args() {
    if [ ! -d "$WORKSPACE" ]; then
        log_warn "[WARN] workspace: ${WORKSPACE} no found"
        exit 1
    fi

    if [ ! -d "$BACKUP_STORAGE" ]; then
        log_warn "[WARN] backup storage: ${BACKUP_STORAGE} no found"
        exit 1
    fi
}

end_volumes_backup() {
    if [ ! -n $CURRENT_REPOSITORY ]; then
        log_info "restart ${CURRENT_REPOSITORY} services"
        docker compose start || 
        log_error "restarting ${CURRENT_REPOSITORY} services"
    fi
    log_info "end docker volumes backup routine"
}

volume_backup() {
    BACKUP_NAME="${VOLUME}_$(date +%F_%H%M).tar.gz"

    log_info "init ${VOLUME} backup"
    docker run --rm \
        --user "$(id -u):$(id -g)" \
        -v "$VOLUME":/data:ro \
        -v "$BACKUP_STORAGE":/backup \
        alpine tar czf "/backup/${BACKUP_NAME}.tmp" -C /data . || { 
          log_error "during ${VOLUME} backup"; exit 1; }

    mv "${BACKUP_STORAGE}/${BACKUP_NAME}.tmp" "${BACKUP_STORAGE}/${BACKUP_NAME}"

    log_info "end ${VOLUME} backup"
}

validate_repository() {
    if [ -z "$SERVICES" ]; then
        log_info "no runnig services found in ${REPOSITORY}"
        return 1
    fi

    if [ -z "$VOLUMES" ]; then
        log_info "no volumes found in ${REPOSITORY}"
        return 1
    fi
}

validate_args

trap "end_volumes_backup; exit 0" EXIT
trap "end_volumes_backup; exit 130" TERM INT

log_info "init docker volumes backup routine"
log_info "config: WORKSPACE=${WORKSPACE}, BACKUP_STORAGE=${BACKUP_STORAGE}, BACKUP_MAX_AGE=${BACKUP_MAX_AGE}"

for REPOSITORY in $(ls "$WORKSPACE"); do
    cd "${WORKSPACE}/${REPOSITORY}"

    VOLUMES="$(docker compose volumes -q 2>/dev/null || exit 0)"
    SERVICES="$(docker compose ps --services 2>/dev/null || exit 0)"

    validate_repository || continue

    log_info "init ${REPOSITORY} volumes backup: ${VOLUMES}"

    CURRENT_REPOSITORY=$REPOSITORY

    log_info "stop ${REPOSITORY} services"
    docker compose stop --timeout 60 || { 
      log_error "stopping ${REPOSITORY} services"; exit 1; }

    for VOLUME in $VOLUMES; do
        volume_backup
    done

    CURRENT_REPOSITORY=""

    log_info "restart ${REPOSITORY} services"
    docker compose start || { 
      log_error "restarting ${REPOSITORY} services"; exit 1; }

    log_info "end ${REPOSITORY} volumes backup"
done

log_info "clean old backups"
find "$BACKUP_STORAGE" -maxdepth 1 -type f -mmin "+${BACKUP_MAX_AGE}" -print -delete || { log_error "cleaning old backups"; exit 1; }

_log_retention

exit 0