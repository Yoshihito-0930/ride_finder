class Destination < ApplicationRecord
  has_many :users, through: :favorite_destinations
  has_many :favorite_destinations, dependent: :destroy
  has_many :future_visits, dependent: :destroy

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :google_maps_place_id, presence: true
  geocoded_by :address
  after_validation :geocode

  def self.find_or_create_from_place_data(place_data)
    # google_maps_place_id で検索または作成
    destination = find_or_create_by(google_maps_place_id: place_data['place_id']) do |destination|
      destination.name = place_data['name']
      destination.address = place_data['formatted_address']&.delete("日本、")
      destination.latitude = place_data['geometry']['location']['lat']
      destination.longitude = place_data['geometry']['location']['lng']
      destination.rating = place_data['rating']
      destination.image = place_data['photo_url'] if place_data['photo_url'].present?
      destination.google_maps_place_id = place_data['place_id']

      if place_data['opening_hours'] && place_data['opening_hours']['weekday_text']
        destination.business_hours = place_data['opening_hours']['weekday_text'].join("\n")
      end

      destination.user_ratings_total = place_data['user_ratings_total']
    end
    destination
  end
end
