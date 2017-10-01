# Oliverde8 - Maniaplanet Dedicated server Docker file

This image is heavily inspired by MiniGod's docker file witch is available here : https://github.com/MiniGod/maniaplanet-dockerfiles

Main differences are : 
* Images uses latest version (uses MP url that always point to the last version). 
* Uses environment variables to allow usage with docker-compose
* tags are used for each environment/title

**You can use the latest tags to base your own images on but, you can't use it as it is.** 
You will need to use one of the tags.

## Available tags

* **TmCanyon** Pre installs the TmCanyon@nadeo title
* **TmValley** Pre installs the TmValley@nadeo title
* **TmStadium** Pre installs the TmStadium@nadeo title
* **TmLagoon** Pre installs the TmLagoon@nadeo title
* **SmStorm** Pre installs the SmStorm@nadeo title

* **latest** Can be used to build other images for different game modes.

## Required options 

### Environment variables
* **-e MP_LOGIN=<login>** Is the login of the dedicated server. 
* **-e MP_PASSWORD=<password>** Is the password of that account
* **-e MP_PORT=X** X being the port actually exposed to the net. 
* **-e MP_TITLE=<title>** The MP title to run (since MP4 the dedicated comes without any title installed)
* **-e MP_GAME_SETTINGS=<gamesettings>** The match settigns file to load (Exemple : MatchSettings/TMCanyonA.txt)
* **-e MP_CONFIG=<config>** The config file to load. By default the docker has one.

### Ports
Export the ports from the container on the host.
 * **-p 2355:2350 -p 2355:2350/udp**

### Volumes

This will allow you to add  change settings, add maps and see the logs. 

* **-v ./mp-data/Maps:/var/maniaplanet/UserData/Maps**
* **-v ./mp-data/Config:/var/maniaplanet/UserData/Config**
* **-v ./mp-data/Scripts:/var/maniaplanet/UserData/Scripts**
* **-v ./mp-data/Logs:/var/maniaplanet/Logs**

## Example 

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
        -v ./mp-data/Maps:/var/maniaplanet/UserData/Maps \
        oliverde8/mp-dedicated:TmCanyon
```

### Using docker compose

```yaml
dedicated:
    build: oliverde8/mp-dedicated:TmCanyon
    environment:
        MP_LOGIN: my_server1
        MP_PASSWORD: my_server1_password
        MP_PORT: 2350
        MP_TITLE: TmCanyon@nadeo
        MP_GAME_SETTINGS: MatchSettings/TMCanyonA.txt@nadeo
        MP_CONFIG: default.config.xml
	ports:
	    - "2350:2350"
	    - "2350:2350/udp"
    volumes:
        - ./docker/data/UserData/Maps:/var/maniaplanet/UserData/Maps
        - ./docker/data/UserData/Config:/var/maniaplanet/UserData/Config
        - ./docker/data/UserData/Scripts:/var/maniaplanet/UserData/Scripts
```

## Using with server controller. 

You can use this image with a server controller, for it to work you need to allow remote access to the xmlrpc of the dedicated server.

Copty the this file [](./default.config.yml) into `./mp-data/Config` and restart the docker. 