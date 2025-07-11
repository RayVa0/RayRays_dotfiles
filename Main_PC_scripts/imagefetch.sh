#!/usr/bin/env bash 
#The slop, only I know how it works haha

dir="$1"
pic=$(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.bmp" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

lines=$(tput 'lines')
lines4=$(expr $lines / 2)

color=8

#cols=$(tput 'cols')
#echo $cols $lines

if [[ $COLORTERM =~ ^(truecolor|24bit)$ ]]; then
	color="full"
fi

if [ -n "$pic" ]; then
    if [ -n "$2" ]; then
        if [ $2 -eq 1 ]; then #put 1 if you want half terminal formating and a "from" section
            chafa -O 0 -c $color --view-size=x$lines4 "$pic"
            echo -n "From: "
            ~/Documents/code/experiments/find_dir "$pic" && echo
        elif [ $2 -eq 2 ]; then  #put 2 if you want half terminal formating and a "from" and "viewing" section 
            chafa -O 0 -c $color "$pic"
            echo -n "You are viewing "
            ~/Documents/code/experiments/find_file "$pic"
            echo -n ", from "
             ~/Documents/code/experiments/find_dir "$pic" && echo
        elif [ $2 -eq 3 ]; then #put 3 for terminal formating and no bells and whistles 
             chafa -O 0 -c $color --view-size=x$lines4 "$pic"
        fi
    else
        chafa -O 0 -c $color "$pic"
    fi
else
    echo "No image files found in $dir"
fi
