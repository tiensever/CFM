class CreateHostings < ActiveRecord::Migration
  def self.up
    create_table :hostings do |t|
      t.integer :movie_id, :null => false
      t.integer :city_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :hostings
  end
end
