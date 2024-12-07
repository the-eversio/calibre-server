FROM debian:bookworm-slim

ENV CALIBRE_DIR=/opt/calibre

RUN \
	apt update && \
	apt install -y --no-install-recommends calibre && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

COPY run-calibre.sh /usr/bin/run-calibre.sh

CMD ["/usr/bin/run-calibre.sh"]
