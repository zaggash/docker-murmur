[![](https://imagelayers.io/badge/zaggash/docker-murmur:latest.svg)](https://imagelayers.io/?images=zaggash/docker-murmur:latest 'Get your own badge on imagelayers.io')

![https://wiki.mumble.info/wiki/Main_Page](https://wiki.mumble.info/logo.png)

Mumble is an open source, low-latency, high quality voice chat software primarily intended for use while gaming.

Based on linuxserver.io baseimage but NOT SUPPORTED by them.

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

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Updates

* Upgrade to the latest version simply `docker restart <container-name>`.
* To monitor the logs of the container in realtime `docker logs -f <container-name>`.


## Versions

+ **23-01-2016:** This is the standard Version type now. 
