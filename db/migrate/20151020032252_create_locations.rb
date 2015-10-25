class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.references :driver, index: true, foreign_key: true
      t.timestamps
    end
    add_index :locations, [:latitude, :longitude]
  end
end
