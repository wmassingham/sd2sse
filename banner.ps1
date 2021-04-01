param (
    [Parameter(Mandatory = $true)][string]$infile
)


$outfile = $infile#.replace('.png', '.dds')
$outfile = $infile.replace('_diffuse','')

write-output "converting $infile"
write-output "to $outfile"

new-alias magick "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI\magick.exe"
magick convert $infile -gravity northeast -crop 2048x4096+1024+0 +repage $outfile
magick convert $outfile -format dds -define dds:compression=dxt5 $outfile.replace('.png','.dds')
