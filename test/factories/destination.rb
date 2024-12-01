FactoryBot.define do
  factory :destination do
    name { 'test' }
    address { '東京都千代田区丸の内１丁目' }
    latitude { 35.6809591 }
    longitude { 139.7673068 }
    sequence(:google_maps_place_id, 'hogehoge_1')
  end
end
