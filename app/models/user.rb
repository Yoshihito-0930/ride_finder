class User < ApplicationRecord
  has_many :conditions
  has_many :favorite_destinations, dependent: :destroy
  has_many :future_visits, dependent: :destroy
  has_many :destinations, through: :favorite_destinations, source: :destination
  has_many :future_visit_destinations, through: :future_visits, source: :destination

  validates :uid, presence: true
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "default@example.com" # line利用時emailが無い場合のデフォルト
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def favorite(destination)
    destinations << destination
  end
  
  def unfavorite(destination)
    destinations.destroy(destination)
  end
  
  def favorite?(destination)
    destinations.include?(destination)
  end
end
