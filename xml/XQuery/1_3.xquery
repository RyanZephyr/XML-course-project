xquery version "1.0";
for $x in doc("movies_30.xml")/movies/movie
order by $x/basic/genres/genre[position()=1]/@category
return concat("&#10;", data($x/basic/genres/genre[position()=1]/@category), "-", data($x/basic/name/Chinese_name))