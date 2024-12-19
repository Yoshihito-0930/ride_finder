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

  def self.find_or_create_from_place_data(place_data)
    # google_maps_place_id で検索または作成
    find_or_create_by(google_maps_place_id: place_data['place_id']) do |destination|
      destination.name = place_data['name']
      destination.address = place_data['formatted_address']&.delete('日本、')
      destination.latitude = place_data['geometry']['location']['lat']
      destination.longitude = place_data['geometry']['location']['lng']
      destination.rating = place_data['rating']
      destination.google_maps_place_id = place_data['place_id']
      destination.website = place_data['website'] if place_data['website'].present?
      destination.user_ratings_total = place_data['user_ratings_total']

      if place_data['photo_url'].present?
        begin
          image_url = place_data['photo_url']
          if URI.parse(image_url).scheme == 'https'
            # URLから画像データを取得
            image_data = URI.open(image_url)
            content_type = image_data.content_type
            file_extension = content_type.split('/').last

            # Active Storageに保存
            destination.image.attach(
              io: image_data,
              filename: "destination_image_#{SecureRandom.hex}.#{file_extension}",
              content_type: content_type
            )
          end
        rescue StandardError => e
          Rails.logger.error("Image upload failed: #{e.message}")
        end
      end
      if place_data['opening_hours'] && place_data['opening_hours']['weekday_text']
        destination.business_hours = place_data['opening_hours']['weekday_text'].join("\n")
      end

      Rails.logger.error("Destination creation failed: #{destination.errors.full_messages}") if destination.invalid?
      destination.save
      destination
    end
  end
end
