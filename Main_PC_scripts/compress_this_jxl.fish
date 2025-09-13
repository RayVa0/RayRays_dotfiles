#!/usr/bin/env fish
mkdir output
set size (find ./ -type f -size +1024k | grep -iE "(jpg|jpeg|png|webp)" | wc -l)
set count 1

for i in (find ./ -type f -size +1024k | grep -iE "(jpg|jpeg|png|webp)")
  set name (echo $i | sed 's/\.[^.]*$//' | cut -c 3-)
  set name_alt (echo $i | sed 's/\.[^.]*$//')
  mkdir -p output/(dirname $name_alt.jxl)
  touch $name.jxl
  cjxl --quiet -d 1 -e 10 --lossless_jpeg=0 --faster_decoding=4 $i output/$name.jxl
  if test $status -ne 0
    set_color red; echo an encode failed copying file as was
    cp -v $i output/
    set_color normal
  end

  echo Compressing -- $count/$size
  set count (math "$count + 1")
end

for i in (find ./ -maxdepth 1 -type f -size -1024k | grep -iE "(jpg|jpeg|png|webp|jxl|avif)")
  cp -v $i output/
end

