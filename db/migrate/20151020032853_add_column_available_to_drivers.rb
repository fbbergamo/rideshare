class AddColumnAvailableToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :available, :boolean
    add_index :drivers, :available
  end
end
