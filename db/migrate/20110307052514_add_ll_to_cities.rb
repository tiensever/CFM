class AddLlToCities < ActiveRecord::Migration
  def self.up
    add_column :cities, :lat, :float
    add_column :cities, :lng, :float
  end

  def self.down
    remove_column :cities, :lat
    remove_column :cities, :lng
  end
end
