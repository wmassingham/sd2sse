#!/bin/bash

infile=$(echo "$1" | sed -e 's|C:|/mnt/c|' -e 's|\\|/|g')
outfile=$(echo "$infile" | sed -e 's/_diffuse.png$/.dds/' -e 's/_normal.png/_n.dds/')

echo "converting $infile"
echo "to $outfile"
# magick convert $infile -gravity northeast -crop 2048x4096+1024+0 +repage $outfile
# magick convert $outfile -format dds -define dds:compression=dxt5 $outfile.replace('.png','.dds')

rm $outfile

convert "$infile" \
    -gravity northeast \
    -background transparent \
    -crop 2048x4096+1024+0!   +repage \
    -resize 1744x4096+304+0!  +repage \
    -extent 2048x4096+0+0! +repage \
    -format dds -define dds:compression=dxt5 "$outfile"
#rm "$infile"

# read
