#!/usr/bin/env fish
mkdir output
set size (find ./ -type f -size +1024k | grep -iE "(.jpg|.jpeg|.png|.webp|.avif)" | wc -l)
set size_jpeg_small (find ./ -type f -size -1024k | grep -iE "(.jpg|.jpeg)" | wc -l)
set count 1

echo "-- FIRST PASS --"
echo "compressing images bigger than a megabyte"
for i in (find ./ -type f -size +1024k | grep -iE "(.jpg|.jpeg|.png|.webp|.avif)")
  set name (echo $i | sed 's/\.[^.]*$//' | cut -c 3-)
  set name_alt (echo $i | sed 's/\.[^.]*$//')
  mkdir -p output/(dirname $name_alt.jxl)
  touch output/$name.jxl
  cjxl --quiet -d 1 -e 10 --lossless_jpeg=0 --faster_decoding=4 $i output/$name.jxl
  if test $status -ne 0
    set_color red; echo an encode failed copying file as was
    cp -v $i output/
    set_color normal
  end

  echo Compressing -- $count/$size
  set count (math "$count + 1")
end

echo "-- SECOND PASS --"
echo "lossless jpeg conversion"
for i in (find ./ -type f -size -1024k | grep -iE "(.jpg|.jpeg)")
  set name (echo $i | sed 's/\.[^.]*$//' | cut -c 3-)
  set name_alt (echo $i | sed 's/\.[^.]*$//')
  touch output/$name.jxl
  cjxl --quiet -e 10 --lossless_jpeg=1 $i output/$name.jxl
  if test $status -ne 0
    set_color red; echo an encode failed copying file as was
    cp -v $i output/
    set_color normal
  end

  echo Compressing -- $count/$size_jpeg_small
  set count (math "$count + 1")
end

find output/ -type f -size -1k | xargs rm

for i in (find ./ -maxdepth 1 -type f -size -1024k | grep -iE "(.png|.webp|.jxl|.avif|.mp4)")
  cp $i output/
end

