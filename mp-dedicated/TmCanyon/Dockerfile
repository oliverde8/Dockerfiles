FROM oliverde8/mp-dedicated:latest

#
# Download TMCanyon Pack
#
RUN mkdir UserData/Packs \
    && wget https://v4.live.maniaplanet.com/ingame/public/titles/download/TMCanyon@nadeo.Title.Pack.gbx -qO /tmp/TMCanyon@nadeo.Title.Pack.gbx \
    && cp /tmp/TMCanyon@nadeo.Title.Pack.gbx /var/maniaplanet/UserData/Packs
