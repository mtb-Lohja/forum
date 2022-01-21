#!/bin/zsh

file=$1
folder=$(dirname "$0")
  
echo "$file"
tmpfile=`mktemp -t "$file"`
# Problems
# - ListPages should replace to string "..." but it was easier to just remove
# - hxnormalize removes trailing </body> and </html>, probably due to document errors
LC_ALL=C sed -f "$folder/cleanup.sed" "$file" \
| hxclean \
| hxremove \
    'script',\
    'table.menutop',\
    'table.windowbg2 tr > td:nth-child(2)',\
    'div#container > table:nth-child(3)',\
    'div#container > table:nth-child(4)',\
    'div.dividerbot > span:nth-child(3)',\
    'div.copyright',\
    'div.mainbottom',\
    'ul.QuickLinks',\
    'form[name=jump]',\
    'input',\
    'select',\
    'noscript',\
    'div.displaycontainer > table > tr > td > a',\
    'div.dividertop',\
    'div#ImageAlert',\
    'span.useroffline',\
    'a[onclick^="ListPages"]' \
| hxnormalize -l 100 \
| iconv -f ISO-8859-1 -t UTF-8 \
> "$tmpfile"

# Rename file to align with our link rewriting rules we have at the sed file
if [[ "$file" == "YaBB.pl.html" ]]; then
    mv "$tmpfile" "index.html"
else
    parts=(${(s/=/)file})
    cleaned=$parts[2]
    cleaned=${cleaned/\%2F/-}
    # echo "Renaming $file -> $cleaned"
    mv "$tmpfile" "$cleaned"
    rm "$file"
fi

