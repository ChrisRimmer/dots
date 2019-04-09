#!/usr/bin/sh

pkill compton
stint | sort | uniq | xargs --max-args=3 | ~/bin/rgb2hex.sh | xargs --max-args=1 | grep --color=always -rnif - ~/.dots
compton &!
