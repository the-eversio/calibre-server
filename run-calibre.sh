#!/bin/bash

CALIBRE_SERVER="calibre-server --userdb ${CALIBRE_DIR}/users.sqlite"
MANAGE_USERS="${CALIBRE_SERVER} --manage-users --"
CALIBRERDB="calibredb --with-library=${CALIBRE_DIR}/library"

# ensures CALIBRE_USER/CALIBRE_PASSWORD is a valid set of credentials,
# overwriting previous password if needed
if [[ -n "${CALIBRE_USER}" ]]; then
    ENABLE_AUTH=--enable-auth
    if ${MANAGE_USERS} list | grep -q ${CALIBRE_USER}; then
        ${MANAGE_USERS} chpass ${CALIBRE_USER} ${CALIBRE_PASSWORD}
    else
        ${MANAGE_USERS} add ${CALIBRE_USER} ${CALIBRE_PASSWORD}
    fi
fi

# ensures a library exists in ${CALIBRE_LIBRARY}
CALIBRE_LIBRARY=${CALIBRE_LIBRARY:-${CALIBRE_DIR}/library}
mkdir -p ${CALIBRE_LIBRARY}
calibredb list --with-library ${CALIBRE_LIBRARY} --limit=1 &>/dev/null

CALIBRE_PORT=${CALIBRE_PORT:-8080}

${CALIBRE_SERVER} $ENABLE_AUTH \
	--log=/dev/stderr \
	--access-log=/dev/stdout \
	--max-log-size=0 \
	--enable-local-write \
	--port=${CALIBRE_PORT} \
	${CALIBRE_LIBRARY}
