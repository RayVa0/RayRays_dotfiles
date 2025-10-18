#!/usr/bin/env bash



ls | grep -E "\.(mp4|mkv|webm)$" | shuf | while read -r video; do
  if [[ "$1" = "-crt" ]]; then 
    echo "CRT MODE"
    mpv -vf=eq=gamma_g=0.9:gamma_b=0.95:gamma_r=1 "$video"
  else 
    echo "NORMAL MODE"
    mpv "$video"
  fi
done
