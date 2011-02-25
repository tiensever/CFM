#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class City < ActiveRecord::Base
  has_many :hostings
  has_many :movies, :through => :hostings, :uniq => true
  has_many :places

  validates_associated    :hostings
  validates_presence_of   :name
  validates_uniqueness_of :name

  def self.find_associated_places(id)
    return [['--- select a place ---', nil]] if id.blank?
    city = find_by_id(id)
    places = city.places.map { |p| [p.name, p.id] }
    return [['--- select a place ---', nil]] if places.empty? 
    places
  end

  def self.find_associated_movies(id)
    return [['--- select a movie ---', nil]] if id.blank?
    city = find_by_id(id)
    movies = city.movies.map { |m| [m.name, m.id] }
    return [['--- select a movie ---', nil]] if movies.empty? 
    movies
  end

  def self.film_in_place(movie_id, place_id, city_id)
    # movies filmed in a Place, Place inside a City => that Movie already hosted in City
    # no need to do anything here.
  end
end
