xquery version "1.0";
(:rearranged XML ∫œ≤¢≤È—Ø:)
for $x in doc("3.xml")/countries/country/movie[position()<=10]
where $x/review/@rating>"9.5" and $x/@release_year<"2000"
order by $x/@release_year
return concat("&#10;", data($x/name), "-", data($x/review/@rating), "-", data($x/@release_year), '-"', data($x/review), '"')