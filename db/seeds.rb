# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

cities = ["Hong Kong", "Chicago", "London", "LA", "Glendale California", "LA", "Downey California", "Culver City California"]
movies = ["The Dark Knight", "Pineapple Express"]

cities.uniq.each { |city| City.create( :name => city ) }
movies.each { |movie| Movie.create(:name => movie) }

# Movie 1
movie = Movie.find_by_name(movies[0])
cities[0..3].each do |c|
  city = City.find_by_name(c) 
  Hosting.create(:city_id => city.id, :movie_id => movie.id)
end
# in Hong Kong
place = Place.create(:name => "2 International Finance Centre", :city_id => City.find_by_name(cities[0]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
place = Place.create(:name => "Queen's Road Central", :city_id => City.find_by_name(cities[0]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
# in Chicago
place = Place.create(:name => "Atwood Cafe - 1 Washington St", :city_id => City.find_by_name(cities[1]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
place = Place.create(:name => "Brach's candy Factory - 401 N. Cicero Street", :city_id => City.find_by_name(cities[1]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
# in London
place = Place.create(:name => "Piccadilly Circus", :city_id => City.find_by_name(cities[2]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
place = Place.create(:name => "St John Street", :city_id => City.find_by_name(cities[2]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
# in LA
place = Place.create(:name => "North Hollywood", :city_id => City.find_by_name(cities[3]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)

# Movie 2
movie = Movie.find_by_name(movies[1])
cities[4..7].each do |c|
  city = City.find_by_name(c) 
  Hosting.create(:city_id => city.id, :movie_id => movie.id)
end
# in LA
place = Place.find_by_city_id(City.find_by_name(cities[3]))
Filming.create(:movie_id => movie.id, :place_id => place.id)
# in Downey
place = Place.create(:name => "Rockwell Defence Plant - Bellflower and Imperial Highway", :city_id => City.find_by_name(cities[6]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)
# in Culver
place = Place.create(:name => "Sony Pictures Studios - 10202 W. Washington Blvd", :city_id => City.find_by_name(cities[7]).id)
Filming.create(:movie_id => movie.id, :place_id => place.id)

