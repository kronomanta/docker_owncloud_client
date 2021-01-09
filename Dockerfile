FROM ubuntu:20.10

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN apt-get update -y && apt-get install -y wget gnupg2 curl binutils apt-transport-https cron run-one && \
    wget -nv https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_20.10/Release.key -O - | apt-key add - || exit 1
RUN echo 'deb https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_20.10/ /' > /etc/apt/sources.list.d/owncloud.list && \
    apt-get update -q && \
    apt-get install -y owncloud-client

ENTRYPOINT /entrypoint.sh