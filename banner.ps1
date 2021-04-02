param (
	[Parameter(Mandatory = $true)][string]$infile
)

$env:path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI\;$env:path"
$env:MAGICK_OCL_DEVICE = "OFF" # required due to a bug in 7.0, ok to remove this line starting with 7.0.11-6

$outfile = $infile.replace('_diffuse.png', '.dds').replace('_normal.png', '_n.dds')

Write-Output "converting $infile"
Write-Output "to $outfile"

magick convert $infile `
	-gravity northeast -background transparent `
	-crop 2048x4096+1024+0! +repage `
	-resize 1744x4096+304+0! +repage `
	-extent 2048x4096+0+0! +repage `
	-format dds -define dds:compression=dxt5 "$outfile"

# if it's a normal map, halve the resolution
if ($infile -like '*_normal.png') {
	magick mogrify -resize 50% $outfile
}

Remove-Item $infile
