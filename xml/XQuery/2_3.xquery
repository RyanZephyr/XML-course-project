xquery version "1.0";
data(doc("movies_5.xml")/movies/movie[basic/genres/genre/@category="Comedy" and basic/genres/genre/@category="Animation"]/basic/name/Chinese_name)