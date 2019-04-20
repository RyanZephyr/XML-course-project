xquery version "1.0";
for $x in doc("movies_30.xml")/movies/movie
order by $x/@country
return concat("&#10;", data($x/@country),  "-", data($x/basic/name/Chinese_name))