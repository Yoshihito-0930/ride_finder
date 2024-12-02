class User < ApplicationRecord
  has_many :conditions
  has_many :favorite_destinations, dependent: :destroy
  has_many :future_visits, dependent: :destroy
  has_many :favorites, through: :favorite_destinations, source: :destination
  has_many :upcoming_destinations, through: :future_visits, source: :destination

  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider, message: 'uidとproviderの組み合わせは既に存在します' }
  validates :provider, presence: true, uniqueness: { scope: :uid, message: 'providerとuidの組み合わせは既に存在します' }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || 'default@example.com' # line利用時emailが無い場合のデフォルト
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  # お気に入り機能
  def add_favorite(destination)
    favorites << destination
  end

  def unfavorite(destination)
    favorites.destroy(destination)
  end

  def favorite?(destination)
    favorites.include?(destination)
  end

  # 後で行く機能
  def add_future_visit(destination)
    upcoming_destinations << destination
  end

  def remove_future_visit(destination)
    upcoming_destinations.destroy(destination)
  end

  def future_visit?(destination)
    upcoming_destinations.include?(destination)
  end
end
