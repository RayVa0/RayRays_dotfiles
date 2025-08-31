#!/usr/bin/env bash

snipe_window () {

   sleep 0.3
   window_id=""
   i=1

   while [ -z $window_id ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool windowminimize $window_id
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 200 ]; then 
      exit 1
    fi
  done
}

snipe_window_persistent () {

   sleep 0.3
   window_id=""
   i=1

   while [ 1 -eq 1 ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool windowminimize $window_id
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 50 ]; then 
      exit 0
    fi
  done
}

snipe_window_state () {

   sleep 0.3
   window_id=""
   i=1

   while [ -z $window_id ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool windowstate $window_id --add MINIMIZED
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 1000 ]; then 
      exit 1
    fi
  done
}

snipe_window_state_persistent () {

   sleep 0.3
   window_id=""
   i=1

   while [ 1 -eq 1 ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool windowstate $window_id --add MINIMIZED
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 200 ]; then 
      exit 0
    fi
  done
}

move_to_desktop_2_persistent () {

   sleep 0.3
   window_id=""
   i=1

   while [ 1 -eq 1 ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool set_desktop_for_window $window_id 2
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 20 ]; then 
      exit 0
    fi
  done
}

move_to_desktop_3_persistent () {

   sleep 0.3
   window_id=""
   i=1

   while [ 1 -eq 1 ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool set_desktop_for_window $window_id 3
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 200 ]; then 
      exit 0
    fi
  done
}


snipe_window_state_fullscreen () {

   sleep 0.3
   window_id=""
   i=1

   while [ -z $window_id ]; do
    echo in loop
    window_id=$(kdotool search $1 | tail -n 1)
    echo $window_id
    kdotool windowstate $window_id --add FULLSCREEN
    sleep 0.1
    i=$((i+1))
    if [ $i -gt 1000 ]; then 
      exit 1
    fi
  done
}



sh ~/Templates/run.sh $1

sleep 0.1

if [ "$1" = "vesktop" ]; then 
  snipe_window $1
  sleep 1
  snipe_window_state $1
  sleep 0.2
  snipe_window_state $1 

  exit 0
elif [ "$1" = "steam-native" ]; then 
  sleep 1
  snipe_window_state steam
  sleep 3
  move_to_desktop_2_persistent steam

  exit 0
elif [ "$1" = "element-desktop" ]; then 
  snipe_window_state "element"

  exit 0
else 
  snipe_window $1
fi

exit 0
