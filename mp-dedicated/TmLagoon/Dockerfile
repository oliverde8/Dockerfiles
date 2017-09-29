FROM oliverde8/mp-dedicated:latest

#
# Download TMLagoon Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/TMLagoon@nadeo.Title.Pack.gbx -qO /tmp/TMLagoon@nadeo.Title.Pack.gbx \
    && cp /tmp/TMLagoon@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
