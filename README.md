# calibre-server
Docker image for a [Calibre](https://calibre-ebook.com/) content server

This just installs Caliber in a debian image, ensures a library directory
and user datbase exist, then runs `calibre-server` pointing at them.

## Environment variables

* CALIBRE_DIR - Directory to store the user database and library within the container.  Defaults to `/opt/calibre`.
* CALIBRE_USER - Username used to log into the Calibre content server.  Defaults to `calibre`.
* CALIBRE_PASSWORD - Password used to log into the Caliber content server.  Defaults to `calibre-secret`.
* CALIBRE_PORT - Port to run the Calibre content server on.  Defaults to `8080`.
