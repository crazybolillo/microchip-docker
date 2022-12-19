FROM debian:stable-slim

ENV REPO_DIR=/root/xc8-project

RUN apt update; \
	apt install -y \
		git \
		curl \
		make; \
	rm -rf /var/lib/apt/lists/*;

RUN curl -o /tmp/xc8.run "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc8-v2.40-full-install-linux-x64-installer.run"; \
	chmod +x /tmp/xc8.run; \
	/tmp/xc8.run --mode unattended --netservername crap; \
	rm /tmp/xc8.run; \
	ln -s $(dirname $(find /opt/microchip/ -name "xc8-cc"))/* /usr/local/bin;

COPY build-check.sh docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["build-check.sh"]
