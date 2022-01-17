# Change encoding
s/ISO-8859-1/UTF-8/
# Change logo href
s,http://www.mtb-lohja.com/,/,
# Remove all shjs scripts 
/shjs/d
# Remove blocks
/Info Center block start/,/Info Center block end/d
/Threads Admin Button Bar start/,/Threads Admin Button Bar end/d
/Poll start/,/Poll end/d
/Icon and access info start/,/Icon and access info end/d
/javascript:sendtopicmail(/d
/gb_styles/d
/resize image start/,/resize image end/d
# These lines have invalid HTML, need to remove or replace
/<div class=<\/div>/d
s/<br \/><\/div><\/b>/<br \/><\/b><\/div>/g
# Remove html comments
/<!--/d
