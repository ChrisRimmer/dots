#!/usr/bin/bash

srcDir=${1%/*}
srcBasename=${1##*/}
destDir=${2:-.}
tgtFilenameBase=${srcBasename%.*}

stream() {
  src=$1
  dest=$2
  rate=$3
  ffmpeg \
    -y \
    -i "$1" \
    -preset fast \
    -vsync passthrough \
    -an \
    -c:v libx264 \
    -x264opts 'no-scenecut' \
    -crf $3 \
    -pix_fmt yuv420p \
    -f mp4 "${tgtFilenameBase}_${rate}.mp4"
}

ffmpeg -y -i "$1" -c:a aac -b:a 192k -vn "${destDir}/${tgtFilenameBase}_audio.m4a"

stream "$1" "$destDir" 23
stream "$1" "$destDir" 27
stream "$1" "$destDir" 31
stream "$1" "$destDir" 25
