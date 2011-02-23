#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

module ApplicationHelper
  def list_cities_for_select
    cities = City.all.collect { |c| [c.name, c.id] }
    cities
  end

  def list_movies_for_select
    movies = Movie.all.collect { |m| [m.name, m.id] }
    movies
  end

  def list_places_for_select
    places = Place.all.collect { |p| [p.name, p.id] }
    places 
  end
end
