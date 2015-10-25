class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :plate
      t.string :name
      t.timestamps
    end
  end
end
