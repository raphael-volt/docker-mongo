FROM mongo:latest

LABEL maintainer "Raphaël Volt <raphael@ketmie.com>"

COPY mongo-init.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/*.sh