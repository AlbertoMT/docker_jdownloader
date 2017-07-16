#!/bin/bash
set -e

USER="jdownloader"
JDOWNLOADER_UID="1234"
JDOWNLOADER_GID="1234"


chown -R ${USER}: /jdownloader
chown ${USER}: /media

[[ $(id -u ${USER}) == ${JDOWNLOADER_UID} ]] || usermod  -o -u ${JDOWNLOADER_UID} ${USER}
[[ $(id -g ${USER}) == ${JDOWNLOADER_GID} ]] || groupmod -o -g ${JDOWNLOADER_GID} ${USER}

chown -R ${USER}: /jdownloader
chown ${USER}: /media
cp /myjdownloader.json "/jdownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"


exec su -pc "java -Djava.awt.headless=true -jar JDownloader.jar -norestart 2>&1 >/dev/null" ${USER}