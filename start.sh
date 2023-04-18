#!/bin/bash

# https://github.com/abraunegg/onedrive/

# Variáveis de ambiente
export ONEDRIVE_CONFIG_DIR="${HOME}/.onedrive_conf"
export ONEDRIVE_DATA_DIR="${HOME}/OneDrive"
export ONEDRIVE_CONFIG_VOLUME=onedrive_conf
export ONEDRIVE_DATA_VOLUME=onedrive_data
export ONEDRIVE_UID=`id -u`
export ONEDRIVE_GID=`id -g`

# Variável do script
firstRun='-d'

# Verifica se a pasta de configuração já existe
if [ -d "${ONEDRIVE_CONFIG_DIR}" ]; then
  echo "${ONEDRIVE_CONFIG_DIR} já existe" ;
else  
  firstRun='-it';
  mkdir -p "${ONEDRIVE_CONFIG_DIR}";
  # Copia o arquivo que controla as pastar/arquivos que vou sincronizar e arquivo de configuração
  cp ./config/sync_list "${ONEDRIVE_CONFIG_DIR}"
  cp ./config/config "${ONEDRIVE_CONFIG_DIR}"
  echo "${ONEDRIVE_CONFIG_DIR} foi criada"
fi

# Verifica se a pasta para dados já existe
if [ -d "${ONEDRIVE_DATA_DIR}" ]; then
  echo "${ONEDRIVE_DATA_DIR} já existe" ;
else
  mkdir -p "${ONEDRIVE_DATA_DIR}";
  echo "${ONEDRIVE_DATA_DIR} foi criada"
fi

# Verifica se o docker volume para o arquivo de configuração já existe
if docker volume inspect ${ONEDRIVE_CONFIG_VOLUME} > /dev/null 2>&1; then
  echo "${ONEDRIVE_CONFIG_VOLUME} já existe"
else
  docker volume create --driver local --opt type=none --opt device="${ONEDRIVE_CONFIG_DIR}" --opt o=bind ${ONEDRIVE_CONFIG_VOLUME} > /dev/null 2>&1;
  echo "${ONEDRIVE_CONFIG_VOLUME} foi criado"
fi

# Verifica se o docker volume para a pasta de dados já existe
if docker volume inspect ${ONEDRIVE_DATA_VOLUME} > /dev/null 2>&1; then
  echo "${ONEDRIVE_DATA_VOLUME} já existe"
else
  docker volume create --driver local --opt type=none --opt device="${ONEDRIVE_DATA_DIR}" --opt o=bind ${ONEDRIVE_DATA_VOLUME} > /dev/null 2>&1;
  echo "${ONEDRIVE_DATA_VOLUME} foi criado"
fi

# Executa o container
docker run $firstRun --name onedrive \
    -v "${ONEDRIVE_CONFIG_DIR}:/onedrive/conf" \
    -v "${ONEDRIVE_DATA_VOLUME}:/onedrive/data" \
    -e "ONEDRIVE_UID=${ONEDRIVE_UID}" \
    -e "ONEDRIVE_GID=${ONEDRIVE_GID}" \
    -e "ONEDRIVE_RESYNC=1" \
    driveone/onedrive:latest

