#!/usr/bin/env fish
mkdir output
set size (find ./ -type f -size +1M | grep -iE "(jpg|jpeg|png|webp|jxl|avif)" | wc -l)
set count 1

for i in (find ./ -type f -size +1M | grep -iE "(jpg|jpeg|png|webp|jxl|avif)")
  set name (echo $i | sed 's/\.[^.]*$//' | cut -c 3-)
  cjxl --quiet -d 1 -e 8 --lossless_jpeg=0 --faster_decoding=4 $i output/$name.jxl
  echo Compressing -- $count/$size
  set count (math "$count + 1")
end

for i in (find ./ -type f -size -1M | grep -iE "(jpg|jpeg|png|webp|jxl|avif)")
  cp -v $i output/
end

