#!/bin/bash
chown -R ${PUID}:${PGID} /opt/alist/
chown -R ${PUID}:${PGID} /opt/aria2/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} nohup aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/opt/aria2/data/aria2.conf \
  >/opt/aria2/data/log/log.log 2>&1 &

exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
