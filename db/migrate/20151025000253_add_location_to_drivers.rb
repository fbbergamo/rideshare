class AddLocationToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :latitude, :float
    add_column :drivers, :longitude, :float
    add_index :drivers, [:latitude, :longitude]

  end
end
