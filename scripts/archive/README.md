# Archival scripts

These scripts are used to format the static wget copy to a long term, static
HTML archive.

## Usage

Download wget archive:

```
`wget -m --convert-links --reject-regex '.+sesredir\=.+' --adjust-extension \
  --page-requisites -U Mozilla -e robots=off http://foorumi.mtb-lohja.com`
```

Run `./cleanup.sh` inside `cgi-bin/yabb2` folder.
