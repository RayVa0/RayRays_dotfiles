#!/usr/bin/env bash


cd /run/user/1000
goto=$(ls | head -n 1)
cd $goto
cd storage/emulated/0/Pictures/Gallery/owner/
mv Repo/* -t ~/Pictures/The_Repo
mv Art/* -t ~/Pictures/Photos/Art/
mv HW/* -t ~/Pictures/Photos/Homework/
