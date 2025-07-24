#!/usr/bin/env bash


user_satisfied=0
line_number=1
explicit="-e"


if [ "$1" = "$explicit" ]; then  
  initial_check=$(yay -Q | grep $2 | wc -l)
  if [ $initial_check -eq 0 ]; then 
    echo No matches found 
    exit 1
  fi

  echo matching packages
  yay -Q | grep $2 | awk '{printf "%d: %s\n", NR, $0}'
  echo -n Which one do you want gone?
  read -p "" selected
  temp=$(yay -Q | grep $2 | awk "NR==$selected")
  to_delete=$(echo $temp | cut -f1 -d" ")
else
  initial_check=$(yay -Q | grep $1 | wc -l)
  if [ $initial_check -eq 0 ]; then 
    echo No matches found 
    exit 1
  fi

  while [ $user_satisfied -eq 0 ]; do
    temp=$(yay -Q | grep $1 | awk "NR==$line_number")
    to_delete=$(echo $temp | cut -f1 -d" ")
    echo -n Trying delete \"$to_delete\"
    read -p "Is this ok?[Y/n]" ans

    case "$ans" in 
      "Y") user_satisfied=1;;
      "y") user_satisfied=1;;
      "n") ;; 
      "N") ;;
      *) user_satisfied=1;;
    esac

  line_number=$((line_number+1))
    
  done 
fi

yay -Rddns $to_delete

