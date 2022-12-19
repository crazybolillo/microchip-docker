FROM debian:stable-slim

ENV XC8_RUN=/opt/xc8.run

RUN apt update; \
	apt install -y \
		git \
		curl \
		make; \
	rm -rf /var/lib/apt/lists/*;

RUN curl -o ${XC8_RUN} "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc8-v2.40-full-install-linux-x64-installer.run"; \
	chmod +x ${XC8_RUN};

COPY build-check.sh docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["build-check.sh"]
