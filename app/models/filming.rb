#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class Filming < ActiveRecord::Base
  belongs_to :movie
  belongs_to :place

  validates_presence_of :movie_id
  validates_presence_of :place_id
end
