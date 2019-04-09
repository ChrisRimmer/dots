#!/usr/bin/sh

pushd ~/video/walls/
youtube-dl -f 'bestvideo[height<=480]' -k $1 -o '~/video/walls/%(id)s.%(ext)s'
popd
