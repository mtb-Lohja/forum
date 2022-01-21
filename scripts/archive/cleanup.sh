#!/bin/zsh

# Clean files we don't want 
rm -f *action=*.html

folder=$(dirname "$0")

# Alter all html files
# Use Xargs instead of for loop for parallellism
ls *.html | xargs -n 1 -P 16 -I{} sh -c "$folder/cleanup_one.sh {}"
