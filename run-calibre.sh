#!/bin/bash

CALIBRE_SERVER="calibre-server --userdb ${CALIBRE_DIR}/users.sqlite"
MANAGE_USERS="${CALIBRE_SERVER} --manage-users --"
CALIBRERB="calibredb --with-library=${CALIBRE_DIR}/library"

# ensures CALIBRE_USER/CALIBRE_PASSWORD is a valid set of credentials,
# overwriting previous password if needed
if ${MANAGE_USERS} list | rg -q ${CALIBRE_USER}; then
	${MANAGE_USERS} chpass ${CALIBRE_USER} ${CALIBRE_PASSWORD}
else
	${MANAGE_USERS} add ${CALIBRE_USER} ${CALIBRE_PASSWORD}
fi

# ensures a library exists in ${CALIBRE_DIR}/library
mkdir -p ${CALIBRE_DIR}/library
calibredb list --with-library ${CALIBRE_DIR}/library --limit=1 &>/dev/null

${CALIBRE_SERVER} \
	--log=/dev/stderr \
	--access-log=/dev/stdout \
	--max-log-size=0 \
	--enable-auth \
	--enable-local-write \
	--port=${CALIBRE_PORT} \
	${CALIBRE_DIR}/library
