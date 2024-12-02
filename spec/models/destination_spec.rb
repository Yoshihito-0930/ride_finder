require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      destination = build(:destination)
      expect(destination).to be_valid
      expect(destination.errors).to be_empty
    end

    it 'nameが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_name = build(:destination, name: '')
      expect(destination_without_name).to be_invalid
      expect(destination_without_name.errors[:name]).to eq ['を入力してください']
    end

    it 'addressが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_address = build(:destination, address: '')
      expect(destination_without_address).to be_invalid
      expect(destination_without_address.errors[:address]).to eq ['を入力してください']
    end

    it 'latitude(緯度)が無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_latitude = build(:destination, latitude: nil)
      expect(destination_without_latitude).to be_invalid
      expect(destination_without_latitude.errors[:latitude]).to eq ['を入力してください']
    end

    it 'longitude(軽度)が無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_longitude = build(:destination, longitude: nil)
      expect(destination_without_longitude).to be_invalid
      expect(destination_without_longitude.errors[:longitude]).to eq ['を入力してください']
    end

    it 'google_maps_place_idが無い場合にバリデーションが機能してinvalidになるか' do
      destination_without_google_maps_place_id = build(:destination, google_maps_place_id: '')
      expect(destination_without_google_maps_place_id).to be_invalid
      expect(destination_without_google_maps_place_id.errors[:google_maps_place_id]).to eq ['を入力してください']
    end

    it 'google_maps_place_idが被った場合にuniqueのバリデーションが機能してinvalidになるか' do
      destination = create(:destination)
      invalid_destination = build(:destination, google_maps_place_id: destination.google_maps_place_id)
      expect(invalid_destination).to be_invalid
      expect(invalid_destination.errors[:google_maps_place_id]).to eq ['はすでに存在します']
    end
  end
end
