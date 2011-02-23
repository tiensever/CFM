#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class Hosting < ActiveRecord::Base
  belongs_to :city
  belongs_to :movie

  validates_presence_of :city_id
  validates_presence_of :movie_id
end
