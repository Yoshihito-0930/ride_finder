class CreateFavoriteDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_destinations do |t|
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
    add_index :favorite_destinations, [:user_id, :destination_id], unique: true
  end
end
