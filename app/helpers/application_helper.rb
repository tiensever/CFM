#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

module ApplicationHelper
  def list_cities_for_select
    City.all.collect { |c| [c.name, c.id] }
  end

  def list_movies_for_select
    Movie.all.collect { |m| [m.name, m.id] }
  end

  def list_places_for_select
    Place.all.collect { |p| [p.name, p.id] }
  end
end
