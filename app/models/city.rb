#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

require 'geokit'
include Geokit::Geocoders

class City < ActiveRecord::Base
  has_many :hostings, :dependent => :destroy
  has_many :movies, :through => :hostings, :uniq => true
  has_many :places, :dependent => :destroy

  validates_associated    :hostings
  validates_presence_of   :name
  validates_uniqueness_of :name

  before_save :add_ll

  def self.find_associated_places(id)
    city = find_by_id(id)
    return [] if city.nil?
    places = city.places.map { |p| [p.name, p.id] }
    places
  end

  def self.find_associated_movies(id)
    city = find_by_id(id)
    return [] if city.nil?
    movies = city.movies.map { |m| [m.name, m.id] }
    movies
  end

  def self.film_in_place(movie_id, place_id, city_id)
    # movies filmed in a Place, Place inside a City => that Movie already hosted in City
    # no need to do anything here.
  end

  def get_all_places_map
    map = Cartographer::Gmap.new('map')
    map.zoom = :bound
    map.icons << Cartographer::Gicon.new

    places = self.places
    
    for place in places
      marker = Cartographer::Gmarker.new(:name=> 'placename', :marker_type => "Building", :position => [place.lat, place.lng])
      map.markers << marker
    end

    map
  end

  def add_ll
    begin
      location = GoogleGeocoder.geocode(self.name)
      self.lat, self.lng = location.lat, location.lng
    rescue Exception => e
      logger.error "===================================================="
      logger.error "error geocoding city => #{e}"
      logger.error "===================================================="
      self.lat, self.lng = 0, 0
    end
  end
end
