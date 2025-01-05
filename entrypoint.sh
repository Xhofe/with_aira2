#!/bin/bash
chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

exec su-exec root:root nohup aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/root/.aria2/aria2.conf \
  >/dev/null 2>&1 &

exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
