#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class Movie < ActiveRecord::Base
  has_many :hostings
  has_many :cities, :through => :hostings, :uniq => true
  has_many :filmings
  has_many :places, :through => :filmings, :uniq => true

  validates_associated    :hostings
  validates_associated    :filmings
  validates_presence_of   :name
  validates_uniqueness_of :name

  def self.find_associated_cities(id)
    return [['--- select a city ---', nil]] if id.blank?
    movie = find_by_id(id)
    cities = movie.cities.map { |c| [c.name, c.id] }
    cities
  end

  def self.film_in_place(movie_id, place_id)
    Filming.create(:movie_id => movie_id, :place_id => place_id)  
  end
end
