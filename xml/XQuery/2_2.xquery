xquery version "1.0";
data(doc("movies_10.xml")/movies/movie[@ranking<"35" and review/@number>"1000000"]/basic/name/Chinese_name)