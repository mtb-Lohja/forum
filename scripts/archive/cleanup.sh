#!/bin/zsh

# Clean files we don't want 
rm *action=*.html

folder=$(dirname "$0")

# Alter all html files
# Use Xargs instead of for loop for parallellism
ls *.html | xargs -n 1 -P 16 -I{} sh -c "$folder/cleanup_one.sh {}"

# Rename all files
for file in *.html;
do
  if [[ "$file" == "YaBB.pl.html" ]]; then
    mv "$file" "index.html"
  else
    parts=(${(s/=/)file})
    cleaned=$parts[2]
    echo "Renaming $file -> $cleaned"
    mv "$file" "$cleaned"
  fi

done
