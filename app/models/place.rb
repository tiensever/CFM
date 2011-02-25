#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class Place < ActiveRecord::Base
  belongs_to :city
  has_many   :filmings
  has_many   :movies, :through => :filmings, :uniq => true

  validates_associated    :filmings
  validates_presence_of   :city_id
  validates_presence_of   :name
  validates_uniqueness_of :name

  def self.find_associated_movies(id)
    return [['--- select a movie ---', nil]] if id.blank?
    place = find_by_id(id)
    movies = place.movies.map { |m| [m.name, m.id] }
    movies
  end

  def self.find_associated_cities(id)
    return [['--- select a city ---', nil]] if id.blank?
    place = find_by_id(id)
    [[place.city.name, place.city.id]]
  end

  def self.film_in_place(movie_id, place_id)
    Filming.create(:movie_id => movie_id, :place_id => place_id)
  end
end
