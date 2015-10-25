require 'geo_hash'
option = {}
option.merge!({db: 14}) if Rails.env.test?
$geohash = GeoHash.new(option)
