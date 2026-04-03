#!/bin/bash

# ex. flavio-vault-creator Documentos/cofre-pessoal 10

if [ "$EUID" -ne 0 ]; then
    echo "[WARN] este script deve ser executado como root!"
    exit 1
fi

PATH_ATUAL=$(pwd)

DESTINO_DO_COFRE=$1
TAMANHO_DO_COFRE=$2

NOME_DO_COFRE=$(basename $DESTINO_DO_COFRE)

cd $PATH_ATUAL

if [ -e $DESTINO_DO_COFRE ]; then
    echo "[WARN] destino do cofre já está em uso!"
    exit 1
fi

if [ -e "/dev/mapper/$NOME_DO_COFRE" ]; then
    echo "[WARN] já existe cofre com esse nome!"
    exit 1
fi

echo "[INFO] Resumo da operação
- Nome do cofre: ${NOME_DO_COFRE}
- Destino do cofre: ${DESTINO_DO_COFRE}
- Tamanho do cofre: ${TAMANHO_DO_COFRE}GB"

read -p "Deseja continuar? (s/n): " CONFIRMACAO

if [ "$CONFIRMACAO" != "s" ]; then
  echo "[INFO] Operação cancelada."
  exit 1
fi

set -e

echo "[INFO] Criando disco virtual"
dd if=/dev/zero of=$DESTINO_DO_COFRE bs=1G count=$TAMANHO_DO_COFRE

echo "[INFO] Criptografando disco virtual"
cryptsetup luksFormat $DESTINO_DO_COFRE

echo "[INFO] Abrindo disco criptografado"
cryptsetup open $DESTINO_DO_COFRE $NOME_DO_COFRE

echo "[INFO] Formatando disco criptografado"
mkfs.ext4 /dev/mapper/$NOME_DO_COFRE

echo "[INFO] Fechando disco criptografado"
cryptsetup close $NOME_DO_COFRE

set +e

echo "[INFO] Cofre $NOME_DO_COFRE criado com sucesso!"

exit 0
