#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class Movie < ActiveRecord::Base
  has_many :hostings, :dependent => :destroy
  has_many :cities, :through => :hostings, :uniq => true
  has_many :filmings, :dependent => :destroy
  has_many :places, :through => :filmings, :uniq => true

  validates_associated    :hostings
  validates_associated    :filmings
  validates_presence_of   :name
  validates_uniqueness_of :name

  def self.find_associated_cities(id)
    return [['--- select a city ---', nil]] if id.blank?
    movie = find_by_id(id)
    cities = movie.cities.map { |c| [c.name, c.id] }
    return [['--- select a city ---', nil]] if cities.empty? 
    cities
  end

  def self.film_in_place(movie_id, place_id)
    Filming.create(:movie_id => movie_id, :place_id => place_id)  
  end

  def get_all_cities_map
    map = Cartographer::Gmap.new( 'map' )
    map.zoom = :bound
    map.icons << Cartographer::Gicon.new

    cities = self.cities
    for city in cities
      marker = Cartographer::Gmarker.new(:name=> "cityname", :marker_type => "Building", :position => [city.lat, city.lng])
      map.markers << marker
    end

    map
  end
end
