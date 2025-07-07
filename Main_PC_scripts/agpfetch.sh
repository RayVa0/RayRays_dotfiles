#!/bin/env bash

dir="/mnt/SATA_SSD/Photos/Homework/Not_Vanilla/Gender/MtF/"
pic=$(find $dir -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.bmp" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

color=8

if [[ $COLORTERM =~ ^(truecolor|24bit)$ ]]; then
	color="full"
fi

chafa -O 0 -c $color "$pic"
echo -n "You are viewing "
~/Documents/code/experiments/find_file "$pic"
    

