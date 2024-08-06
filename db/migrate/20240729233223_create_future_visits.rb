class CreateFutureVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :future_visits do |t|
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true
      
      t.timestamps
    end
    add_index :future_visits, [:user_id, :destination_id], unique: true
  end
end
