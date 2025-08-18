#!/usr/bin/env bash

safe=1

for x in `ls -1 *.webp`; 
  do dwebp {} -o ${x%.*}.png ::: $x;
  if [ $? -ne 0 ]; then 
    safe=0 
  fi
done

if [ $safe -eq 1 ]; then
  rm *.webp 
else
  echo -e  "\e[31mOne of the conversions failed, not deleting webp files\e[0m"
fi
