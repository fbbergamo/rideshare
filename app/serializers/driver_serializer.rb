class DriverSerializer < ActiveModel::Serializer
   attributes :id, :plate, :latitude, :longitude, :available
end
