# calibre-server

Docker image for a [Calibre](https://calibre-ebook.com/) content server

This just installs Caliber in a debian image, ensures a library directory
and user database exist, then runs `calibre-server` pointing at them.

## Environment variables

* `CALIBRE_LIBRARY` - Directory to store the calibre library within the container.  Defaults to `/opt/calibre/library`.
* `CALIBRE_USER` - Username used to log into the Calibre content server. If not set, auth will be disabled.
* `CALIBRE_PASSWORD` - Password used to log into the Caliber content server.
* `CALIBRE_PORT` - Port to run the Calibre content server on. Defaults to `8080`.
