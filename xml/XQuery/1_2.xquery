xquery version "1.0";
for $x in doc("movies_30.xml")/movies/movie
order by $x/review/@rating
return concat("&#10;", data($x/basic/name/Chinese_name), "-∂π∞Í∆¿∑÷: ö", data($x/review/@rating))