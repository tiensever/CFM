class CreateFilmings < ActiveRecord::Migration
  def self.up
    create_table :filmings do |t|
      t.integer :movie_id, :null => false
      t.integer :place_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :filmings
  end
end
