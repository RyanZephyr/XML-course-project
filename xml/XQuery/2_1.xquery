xquery version "1.0";
(:组合条件查询:)
data(doc("movies_30.xml")/movies/movie[@release_year<"2000" and review/@rating>"9.3" and @country!="USA"]/basic/name/Chinese_name)