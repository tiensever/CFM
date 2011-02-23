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
end
