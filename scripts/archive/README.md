# Archival scripts

These scripts are used to format the static wget copy to a long term, static
HTML archive.

## Usage

Download wget archive for the public part of the forum:

```
wget -m --convert-links --reject-regex '.+sesredir\=.+' --adjust-extension \
  --page-requisites -U Mozilla -e robots=off \
  http://foorumi.mtb-lohja.com
```

Download wget archive for the restricted (members only) part of the forum:

```
wget -m --convert-links --reject-regex '.+sesredir\=.+' --adjust-extension \
  --page-requisites -U Mozilla -e robots=off \
  --header 'Cookie: [Add cookie information from Chrome | copy as cUrl here]' \
  http://foorumi.mtb-lohja.com 
```

Run `./cleanup.sh` inside `cgi-bin/yabb2` folder.
