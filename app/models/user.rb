class User < ApplicationRecord
  has_many :conditions
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "default@example.com" # line利用時emailが無い場合のデフォルト
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
