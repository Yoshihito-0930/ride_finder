class Destination < ApplicationRecord
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :google_maps_place_id, presence: true
  geocoded_by :address
  after_validation :geocode

  
end
