xquery version "1.0";
<countries>&#10;
{
	for $country in distinct-values(doc("movies_30.xml")/movies/movie/@country)
	order by $country
	return <country name="{$country}">&#10;
	{
		for $movie in doc("movies_30.xml")/movies/movie
		where $movie/@country = $country
		return <movie ranking="{$movie/@ranking}" release_year="{$movie/@release_year}">&#10;&#x0009;<name>
		{
			for $movie2 in doc("movies_30.xml")/movies/movie
			where $movie2 = $movie 
			return data($movie2/basic/name/Chinese_name)
		}
		</name>&#10;&#x0009;<review rating="{$movie/review/@rating}">
		{
			data($movie/review)
		}
		</review>&#10;
		</movie>
	}&#10;
	</country>
}&#10;
</countries>