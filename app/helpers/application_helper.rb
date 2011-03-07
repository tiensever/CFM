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

  def list_cities_assoc_movie_for_select(movie_id)
    begin
      Movie.find_by_id(movie_id).cities.collect { |c| [c.name, c.id] }
    rescue Exception => e
      logger.info "Movie drill down ======="
      logger.info "No movies selected ====="
      []
    end
  end

  def list_places_assoc_city_for_select(city_id)
    begin
      City.find_by_id(city_id).places.collect { |p| [p.name, p.id] }
    rescue Exception => e
      logger.info "Movie drill down to city ======="
      logger.info "No cities selected ============="
      []
    end
  end
end
