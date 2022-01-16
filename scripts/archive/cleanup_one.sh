#!/bin/zsh

file=$1
folder=$(dirname "$0")
  
echo "$file"
tmpfile=`mktemp -t "$file"`
# Problems
# - ListPages should replace to string "..." but it was easier to just remove
LC_ALL=C sed -f "$folder/cleanup.sed" "$file" \
| hxremove \
    'script',\
    'table.menutop',\
    'table.windowbg2 > tr > td:nth-child(2)',\
    'div#container > table:nth-child(3)',\
    'div#container > table:nth-child(4)',\
    'form[name=jump]',\
    'div.displaycontainer > table > tr > td > a',\
    'div.dividertop',\
    'div#ImageAlert',\
    'span.useroffline',\
    'a[onclick^="ListPages"]' \
| hxnormalize -l 100 \
> "$tmpfile"

mv "$tmpfile" "$file"	
