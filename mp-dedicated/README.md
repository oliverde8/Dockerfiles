# Oliverde8 - Maniaplanet Dedicated server Docker file

This image is heavily inspired by MiniGod's docker file witch is avaible here : https://github.com/MiniGod/maniaplanet-dockerfiles

Main differences are : 
* Images uses latest version (uses MP url that always point to the last version). 
* Uses environment variables to allow usage with docker-compose

## Required options 

### Environment variables
* **-e MP_PORT=X** X being the port actually exposed to the net. 
* **-e MP_LOGIN=<login>** Is the login of the dedicated server. 
* **-e MP_PASSWORD=<password>** Is the password of that account
* **-e MP_TITLE=<title>** The MP title to run (since MP4 the dedicated comes without any title installed)
* **-e MP_GAME_SETTINGS=<gamesettings>** The match settigns file to load (Exemple : MatchSettings/TMCanyonA.txt)
* **-e MP_CONFIG=<config>** The config file to load.

### Ports
 Exporte the ports from the container on the host.
 * **-p 2355:2350 -p 2355:2350/udp**

### Volumes

Since MP4 the dedicated server comes without any title pack pre installed. YOu need to share volumes in order to add those
to the docker.

* **-v ./mp-data:/var/maniaplanet/UserData**

## Exemple 

### Using docker run

```bash
    docker run \
        -e MP_PORT=2350 \
        -e MP_LOGIN=my_server1 \
        -e MP_PASSWORD=my_server1_password \
        -e MP_TITLE=TmCanyon@nadeo \
        -e MP_GAME_SETTINGS=MatchSettings/TMCanyonA.txt \
        -e MP_CONFIG=default.config.xml \
        -p 2350:2350 -p 2350:2350/udp \
        -v ./mp-data:/var/maniaplanet/UserData \
        oliverde8//mp-dedicated
```

### Using docker compose

```yaml
dedicated:
    build: oliverde8//mp-dedicated
    environment:
        MP_LOGIN: my_server1
        MP_PASSWORD: my_server1_password
        MP_PORT: 2350
        MP_TITLE: TmCanyon@nadeo
        MP_GAME_SETTINGS: MatchSettings/TMCanyonA.txt@nadeo
        MP_CONFIG: default.config.xml
    volumes:
        - ./docker/data/mp:/var/maniaplanet/UserData
```