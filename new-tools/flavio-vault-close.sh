#!/bin/bash

# ex.
# $ flavio-vault-close Documentos/cofre-pessoal
# $ flavio-vault-close /mnt/cofre-pessoal

if [ "$EUID" -ne 0 ]; then
    echo "[WARN] este script deve ser executado como root!"
    exit 1
fi

PATH_ATUAL=$(pwd)
ORIGEM_DO_COFRE=$1
NOME_DO_COFRE=$(basename $ORIGEM_DO_COFRE)
PONTO_DE_MONTAGEM="/mnt/$NOME_DO_COFRE"

cd $PATH_ATUAL

echo "[INFO] Resumo da operação
- Nome do cofre: ${NOME_DO_COFRE}
- Ponto de Montagem: ${PONTO_DE_MONTAGEM}"

read -p "Deseja continuar? (s/n): " CONFIRMACAO

if [ "$CONFIRMACAO" != "s" ]; then
  echo "[INFO] Operação cancelada."
  exit 1
fi

set -e

echo "[INFO] Desmontando o cofre em $PONTO_DE_MONTAGEM..."
umount $PONTO_DE_MONTAGEM

echo "[INFO] Fechando o cofre $NOME_DO_COFRE..."
cryptsetup close $NOME_DO_COFRE

set +e

echo "[INFO] Cofre $NOME_DO_COFRE fechado com sucesso!"

exit 0
