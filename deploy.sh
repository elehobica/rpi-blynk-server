APP_ROOT=`pwd`
WORK_DIR=`pwd | xargs dirname`
IMAGE_NAME=elehobica/rpi-blynk-server:v1

# Generate blynk.service file
sudo echo "[Unit]
Description=BlynkServer
After=syslog.target

[Service]
Type=simple
WorkingDirectory=${WORK_DIR}
ExecStart=/usr/bin/docker run -d --rm --name blynk -v ${APP_ROOT}/data:/data -v ${APP_ROOT}/server.properties:/config/server.properties -p 9443:9443 -p 8440:8440 -p 8080:8080 ${IMAGE_NAME} -dataFolder /data -serverConfig /config/server.properties
TimeoutStopSec=30
StandardOutput=null

[Install]
WantedBy = multi-user.target
" > /etc/systemd/system/blynk.service

# Load and Enable
sudo systemctl daemon-reload
sudo systemctl enable blynk
