# Change all links to use the last part as file name
s_href="YaBB.pl.html"_href="index.html"_g
# num, board, catselect and others match this one
# Paged links have double encoded page, like '/90' = '%252F90', should change to '-90'
s|href="YaBB.pl%3F.\{1,10\}=\([^%]*\)%252F\([0-9]*\)\.html|href="\1-\2.html|g
s|href="YaBB.pl%3F.\{1,10\}=|href="|g
# Links in messages don't work anymore since the domain has changed during the years. Try to fix some of those too
s|href="http://www.mtb-lohja.com/cgi-bin/yabb2/YaBB.pl?num=\([^"]*\)"|href="\1.html"|g
s|href="http://foorumi.mtb-lohja.com/cgi-bin/yabb2/YaBB.pl?num=\([^"]*\)"|href="\1.html"|g
# Change encoding
s/ISO-8859-1/UTF-8/
# Change logo href
s|http://www.mtb-lohja.com/|/|
# Change profile links
s|<a href="http://foorumi.mtb-lohja.com/cgi-bin/yabb2/YaBB.pl?action=viewprofile;username=\([^"]*\)" rel="nofollow">\([^<]*\)</a>|\2|g
# Remove all shjs scripts 
/shjs/d
# Remove forms
s|<form action="\([^"]*\)" method="post" name="\([^"]*\)" style="\([^"]*\)">||g
s|<form method="post" action="\([^"]*\)" name="\([^"]*\)" style="\([^"]*\)">||g
s|<form name="\([^"]*\)" action="\([^"]*\)" method="post" style="\([^"]*\)">||g
s|<form action="\([^"]*\)" method="post">||g
s|</form>||g
# Remove blocks
/Info Center block start/,/Info Center block end/d
/Threads Admin Button Bar start/,/Threads Admin Button Bar end/d
/Poll start/,/Poll end/d
/Icon and access info start/,/Icon and access info end/d
/javascript:sendtopicmail(/d
/gb_styles/d
/resize image start/,/resize image end/d
# These lines have invalid HTML, need to remove or replace
\|<div class=</div>|d
s|<br /></div></b>|<br /></b></div>|g
# Remove html comments
/<!--/d
