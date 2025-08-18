#!/usr/bin/env fish


sudo networkctl 
sudo networkctl down enp8s0
sudo networkctl up enp8s0
~/Templates/pinging.fish
