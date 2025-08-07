#!/usr/bin/env bash


user_satisfied=0
line_number=1
explicit="-e"

if [ $# -eq 2 ] && [ "$1" = "$explicit" ]; then
  echo -n
elif [ $# -ge 2 ]; then 
  echo Please pass only one package for deletion.
  exit 1
fi

if [ $# -lt 1 ]; then
  echo No arguments passed
  exit 1
fi

if [ "$1" = "$explicit" ]; then 
  echo ---Explicit Mode---
  initial_check=$(yay -Q | grep $2 | wc -l)
  if [ $initial_check -eq 0 ]; then 
    echo No matches found 
    exit 1
  fi

  echo Matching packages:
  echo 
  yay -Q | grep $2 | awk '{printf "%d: %s\n", NR, $0}'
  echo
  echo -n 'Which one do you want gone(q to exit)?'
  read -p "" selected

  if [ "$selected" = "q" ]; then 
    echo exiting...
    exit 0
  fi

  temp=$(yay -Q | grep $2 | awk "NR==$selected")
  to_delete=$(echo $temp | cut -f1 -d" ")
else
  echo '---Simple Mode(deprecated)---'
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

  if [ $line_number -gt $initial_check ]; then 
    echo No more packages, exiting.
    exit 0
  fi
    
  done 
fi

yay -Rddns $to_delete

