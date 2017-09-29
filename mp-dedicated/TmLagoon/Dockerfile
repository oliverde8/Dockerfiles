FROM oliverde8/mp-dedicated:latest

#
# Download TMLogoon Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/TMLogoon@nadeo.Title.Pack.gbx -qO /tmp/TMLogoon@nadeo.Title.Pack.gbx \
    && cp /tmp/TMLogoon@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
