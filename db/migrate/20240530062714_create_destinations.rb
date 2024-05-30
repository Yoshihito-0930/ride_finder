class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.references :visit_category, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.float :rating
      t.string :image
      t.string :business_hours

      t.timestamps
    end
  end
end
