FROM oliverde8/mp-dedicated:latest

#
# Download SMStorm Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/SMStorm@nadeo.Title.Pack.gbx -qO /tmp/SMStorm@nadeo.Title.Pack.gbx \
    && cp /tmp/SMStorm@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
