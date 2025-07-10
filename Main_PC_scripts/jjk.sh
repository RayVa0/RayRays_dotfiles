#!/bin/env bash

cd '/mnt/HDD/Media(2)/Jujutsu Kaisen Season 2/'
ep=$(ls | shuf -n 1)
mpv "$ep"
