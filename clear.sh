# Inclui as variáveis de ambiente
source .env

sudo docker container rm -f ${ONEDRIVE_CONTAINER_NAME}
rm -rf "${ONEDRIVE_DATA_DIR}"
rm -rf "${ONEDRIVE_CONFIG_DIR}"
docker volume rm "${ONEDRIVE_DATA_VOLUME}"
docker volume rm "${ONEDRIVE_CONFIG_VOLUME}"
