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
    places
  end
end
