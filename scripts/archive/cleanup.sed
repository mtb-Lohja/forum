# Blokkeja ylhäältä pois
/shjs/d
# Blokkeja pohjalta pois:
/Info Center block start/,/Info Center block end/d
/Threads Admin Button Bar start/,/Threads Admin Button Bar end/d
/Poll start/,/Poll end/d
/Icon and access info start/,/Icon and access info end/d
/javascript:sendtopicmail(/d
## Multidel form start & end
# Breaks structure
# /action=multidel/d
# /formsession/d
/gb_styles/d
/resize image start/,/resize image end/d
# These lines have invalid HTML, need to remove or replace
/<div class=<\/div>/d
s/<br \/><\/div><\/b>/<br \/><\/b><\/div>/g
# Remove html comments
/<!--/d
