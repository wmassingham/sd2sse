#!/bin/bash

infile=$(echo "$1" | sed -e 's|C:|/mnt/c|' -e 's|\\|/|g')
outfile=$(echo "$infile" | sed -e 's/_diffuse//' -e 's/_normal/_n/' -e 's/.png$/.dds/')

echo "converting $infile"
echo "to $outfile"

convert "$infile" \
	-gravity northeast \
	-background transparent \
	-crop 2048x4096+1024+0!   +repage \
	-resize 1744x4096+304+0!  +repage \
	-extent 2048x4096+0+0! +repage \
	-format dds -define dds:compression=dxt5 "$outfile"

# if it's a normal map, halve the resolution
if [[ $infile == *_normal.png ]]; then mogrify -resize 50% $outfile; fi

rm "$infile"
