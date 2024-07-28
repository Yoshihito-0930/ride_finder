class AddUserRatingsTotalToDestinations < ActiveRecord::Migration[7.0]
  def change
    remove_column :destinations, :visit_category_id, :bigint
    add_column :destinations, :user_ratings_total, :integer
    add_column :destinations, :google_maps_place_id, :string, null: false
  end
end
