FROM lsiobase/alpine
MAINTAINER zaggash

# install packages
RUN \
 apk add --no-cache \
	murmur

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 64738
VOLUME /config
