xquery version "1.0";
<movies>{
for $x in(1 to 5)
return doc("movies_30.xml")/movies/movie[$x]
}
{
for $movie in doc("movies_5.xml")/movies/movie
return $movie
}
</movies>