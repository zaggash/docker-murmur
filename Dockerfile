FROM lsiobase/alpine
MAINTAINER zaggash

ENV MURMUR_VERSION=$( \
	wget -q "https://api.github.com/repos/mumble-voip/mumble/releases/latest" -O - |\
	awk '/tag_name/{print $4;exit}' FS='[""]' \
	)

# install packages
RUN \
 apk add --no-cache \
 	openssl \
	icu-libs \
 && wget -q \
        https://github.com/mumble-voip/mumble/releases/download/${MURMUR_VERSION}/murmur-static_x86-${MURMUR_VERSION}.tar.bz2 -O - |\
        bzcat -f |\
        tar -x -C /app -f - \
  && mv /app/murmur* /app/murmur

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 64738
VOLUME /config
