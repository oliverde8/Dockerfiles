FROM oliverde8/mp-dedicated:latest

#
# Download TMValley Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/TMValley@nadeo.Title.Pack.gbx -qO /tmp/TMValley@nadeo.Title.Pack.gbx \
    && cp /tmp/TMValley@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
