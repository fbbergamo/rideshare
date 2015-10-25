class Driver < ActiveRecord::Base
  validates :name, :plate, presence: true
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }, allow_nil: true
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_nil: true

  def update_location(location)
    self.update(location)
    if location[:available]
      $geohash.add_point(id, location[:latitude], location[:longitude])
    elsif $geohash.has_point?(id)
      $geohash.remove_point(id)
    end
  end
end
