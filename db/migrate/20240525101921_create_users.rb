class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :image

      t.timestamps
    end

    add_index :users, %i[provider uid], unique: true
  end
end
