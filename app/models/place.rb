#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

require 'geokit'
include Geokit::Geocoders

class Place < ActiveRecord::Base
  belongs_to :city
  has_many   :filmings, :dependent => :destroy
  has_many   :movies, :through => :filmings, :uniq => true

  validates_associated    :filmings
  validates_presence_of   :city_id
  validates_presence_of   :name
  validates_uniqueness_of :name

  before_save :add_ll

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

  def full_address
    "#{self.name}, #{self.city.name}"
  end

  def add_ll
    begin
      location = GoogleGeocoder.geocode(full_address)
      self.lat, self.lng = location.lat, location.lng
    rescue Exception => e
      logger.error "===================================================="
      logger.error "error geocoding place => #{e}"
      logger.error "===================================================="
      self.lat, self.lng = 0, 0
    end
  end

  def get_place_map
    map = Cartographer::Gmap.new('map')
    map.zoom = :bound
    map.icons << Cartographer::Gicon.new
    marker = Cartographer::Gmarker.new(:name=> 'name', :marker_type => "Building", :position => [self.lat, self.lng])
    map.markers << marker

    map
  end
end
