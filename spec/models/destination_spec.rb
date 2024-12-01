require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      destination = Destination.new(name: "test", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      expect(destination).to be_valid
      expect(destination.errors).to be_empty
    end

    it 'nameが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_name = Destination.new(name: "", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      expect(destination_without_name).to be_invalid
      expect(destination_without_name.errors[:name]).to eq ["を入力してください"]
    end
    
    it 'addressが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_address = Destination.new(name: "test", address: "", latitude: 35.6809591, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      expect(destination_without_address).to be_invalid
      expect(destination_without_address.errors[:address]).to eq ["を入力してください"]
    end
    
    it 'latitude(緯度)が無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_latitude = Destination.new(name: "test", address: "東京都千代田区丸の内１丁目", latitude: nil, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      expect(destination_without_latitude).to be_invalid
      expect(destination_without_latitude.errors[:latitude]).to eq ["を入力してください"]
    end
    
    it 'longitude(軽度)が無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_longitude = Destination.new(name: "test", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: nil, google_maps_place_id: "hogehoge123")
      expect(destination_without_longitude).to be_invalid
      expect(destination_without_longitude.errors[:longitude]).to eq ["を入力してください"]
    end
    
    it 'google_maps_place_idが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_google_maps_place_id = Destination.new(name: "test", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: nil, google_maps_place_id: "")
      expect(destination_without_google_maps_place_id).to be_invalid
      expect(destination_without_google_maps_place_id.errors[:google_maps_place_id]).to eq ["を入力してください"]
    end
    
    it 'google_maps_place_idが被った場合にuniqueのバリデーションが機能してinvalidになるか' do
      destination = Destination.create(name: "test", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      invalid_destination = Destination.new(name: "test", address: "東京都千代田区丸の内１丁目", latitude: 35.6809591, longitude: 139.7673068, google_maps_place_id: "hogehoge123")
      expect(invalid_destination).to be_invalid
      expect(invalid_destination.errors[:google_maps_place_id]).to eq ["はすでに存在します"]
    end
  end
end
