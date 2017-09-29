FROM oliverde8/mp-dedicated:latest

#
# Download TMStadium Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/TMStadium@nadeo.Title.Pack.gbx -qO /tmp/TMStadium@nadeo.Title.Pack.gbx \
    && cp /tmp/TMStadium@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
