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

See example/docker-compose.yml file

## TODO

* When eXp2 is released have different tags for different versions 
