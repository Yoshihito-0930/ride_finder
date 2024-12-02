class AddUniqueIndexToGoogleMapsPlaceId < ActiveRecord::Migration[7.0]
  def change
    add_index :destinations, :google_maps_place_id, unique: true
  end
end
