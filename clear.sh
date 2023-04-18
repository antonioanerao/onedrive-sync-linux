export ONEDRIVE_CONFIG_DIR="${HOME}/.onedrive_conf"
export ONEDRIVE_DATA_DIR="${HOME}/OneDrive"
export ONEDRIVE_CONFIG_VOLUME=onedrive_conf
export ONEDRIVE_DATA_VOLUME=onedrive_data

sudo docker container rm -f onedrive
rm -rf "${ONEDRIVE_CONFIG_DIR}"
rm -rf "${ONEDRIVE_DATA_DIR}"
docker volume rm "${ONEDRIVE_DATA_VOLUME}"
docker volume rm "${ONEDRIVE_CONFIG_VOLUME}"
