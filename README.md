Based on linuxserver.io baseimage but NOT SUPPORTED by them.

# zaggash/docker-murmur
[![](https://images.microbadger.com/badges/image/zaggash/docker-murmur.svg)](https://microbadger.com/images/zaggash/docker-murmur "Get your own image badge on microbadger.com")
[hub]: https://hub.docker.com/r/zaggash/docker-murmur/

![https://wiki.mumble.info/wiki/Main_Page](https://wiki.mumble.info/logo.png)

Mumble is an open source, low-latency, high quality voice chat software primarily intended for use while gaming.


## Usage

```
docker run -d \
  --name=<container-name> \
  -v /etc/localtime:/etc/localtime:ro \
  -v <path to data>:/config \
  -e PGID=<gid>  \
  -e PUID=<uid>  \
  -p 64738:64738 \
  zaggash/docker-murmur
```
**Parameters**

* `-p 64738:64738` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - The config volume
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.


### Usage

The password is generated on first start.
It is written in the logs.
To show the logs of a container, you can execute the following command :

```
docker logs -f container_name
```

You can edit the config in the /config folder.
You need to restart the container to apply the change.
