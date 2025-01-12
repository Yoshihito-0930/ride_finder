class Destination < ApplicationRecord
  has_many :users, through: :favorite_destinations
  has_many :favorite_destinations, dependent: :destroy
  has_many :future_visits, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :google_maps_place_id, presence: true, uniqueness: true
  geocoded_by :address
  after_validation :geocode

  def self.find_or_create_destination(place_data)
    find_or_create_by(google_maps_place_id: place_data['place_id']) do |destination|
      destination.name = place_data['name']
      destination.address = place_data['formatted_address']&.delete('日本、')
      destination.latitude = place_data['geometry']['location']['lat']
      destination.longitude = place_data['geometry']['location']['lng']
      destination.rating = place_data['rating']
      destination.website = place_data['website'] if place_data['website'].present?
      destination.user_ratings_total = place_data['user_ratings_total']
      attach_image(destination, place_data['photo_url']) if place_data['photo_url'].present?

      # 営業時間の処理 後ほど修正
      if place_data['opening_hours'] && place_data['opening_hours']['weekday_text']
        destination.business_hours = place_data['opening_hours']['weekday_text'].join("\n")
      end
    end
  end

  # rubocop:disable Security/Open
  def self.attach_image(destination, image_url)
    if URI.parse(image_url).scheme == 'https'
      image_data = URI.open(image_url)
      destination.image.attach(
        io: image_data,
        filename: "destination_image_#{SecureRandom.hex}.jpg",
        content_type: 'image/jpeg'
      )
    end
  rescue StandardError => e
    Rails.logger.error("Image upload failed: #{e.message}")
    binding.pry
  end
  # rubocop:enable Security/Open
end
