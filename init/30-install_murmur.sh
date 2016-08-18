#!/bin/bash
murmur_dir="/app/murmur"
version_file="${murmur_dir}/VERSION"
[[ ! -f "$version_file" ]] && current_version="0" || current_version=$(cat ${version_file})
latest_version=$(curl -sX GET  "https://api.github.com/repos/mumble-voip/mumble/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')

if [ "$current_version" == "$latest_version" ]; then
	echo "Murmur is already up to date at version $current_version , Skipping"
else
	echo "Installing new Murmur version $latest_version"
	rm -Rf ${murmur_dir}
	curl -sL "https://github.com/mumble-voip/mumble/releases/download/$latest_version/murmur-static_x86-$latest_version.tar.bz2" | bzip2 -q -d | tar -xC /tmp
	mv "/tmp/murmur-static_x86-$latest_version" "$murmur_dir"
	echo "$latest_version" > "$version_file"
fi

[[ ! -f /config/murmur.ini ]] && cp /defaults/murmur.ini /config/murmur.ini
[[ ! -f /config/murmur.log ]] && touch /config/murmur.log
chown -R abc:abc /config
