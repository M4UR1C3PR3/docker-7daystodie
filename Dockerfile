FROM zobees/steamcmd:0.0.1
MAINTAINER cliffrowley@gmail.com

USER root

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get install -q -y --no-install-recommends \
  telnet

USER steam

ADD steam/bin/server.sh /home/steam/bin/server.sh

VOLUME ["/home/steam/public"]

ENV STEAM_APP_ID=294420 \
    STEAM_APP_CMD="/home/steam/bin/server.sh" \
    SDTD_CMD="/home/steam/app/public" \
    SDTD_CONFIG_FILE="/home/steam/public/serverconfig.xml" \
    SDTD_TELNET_PORT=8081

EXPOSE 26900-26902 26900-26902/udp
