#!/usr/bin/env bash


brightness=$(python3 ~/Templates/lerp.py 0 1023 $1 -mcb)
brightnessctl set $brightness 
