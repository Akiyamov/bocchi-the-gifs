#!/bin/bash
for name in *.mp4; do
	palette="/tmp/palette.png"
	filters="fps=15,scale=$1:flags=lanczos"

	ffmpeg -v warning -i $name -vf "$filters,palettegen" -y $palette
	ffmpeg -v warning -i $name -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y "${name%.*}.gif"
done
