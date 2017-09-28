# Oliverde8 - Maniaplanet eXpansion Server Controller

This image is built to run eXpansion server controller. It's not meant to be used for development. 

**This image us built for eXpansion2 and won't work with eXpansion1**

## Environment variables

These variables are optional.

* **DATABASE_HOST** : Host of the database, default value mysql
* **DATABASE_PORT** : Database port
* **DATABASE_NAME** : Name of the database
* **DATABASE_USER** : Name of the database user
* **DATABASE_PASSWORD** : Database password
* **DEDI_HOST** : Host of the dedicated server
* **DEDI_PORT** : Port of the dedicated server
* **DEDI_PASSWORD** : Password for the SuperUser

## Exemple 

### Using docker run

```bash
    docker run oliverde8/mp-expansion
```

### Using docker compose

```yaml
exp:
    build: oliverde8/mp-expansion
    links:
        - mysql
        - dedicated

dedicated:
    build: oliverde8/mp-dedicated
    environment:
        MP_LOGIN: my_server1
        MP_PASSWORD: my_server1_password
        MP_PORT: 2350
        MP_TITLE: TmCanyon@nadeo
        MP_GAME_SETTINGS: MatchSettings/TMCanyonA.txt@nadeo
        MP_CONFIG: default.config.xml
    volumes:
        - ./docker/data/mp:/var/maniaplanet/UserData
        
mysql:
    image: mysql:5.7
    environment:
        MYSQL_ROOT_PASSWORD: ""
        MYSQL_DATABASE: expansion
        MYSQL_USER: root
        MYSQL_PASSWORD: ""
        MYSQL_ALLOW_EMPTY_PASSWORD: "yes"
    volumes:
        - ./docker/data/mysql:/var/lib/mysql
```

## TODO

* When eXp2 is released have different tags for different versions 