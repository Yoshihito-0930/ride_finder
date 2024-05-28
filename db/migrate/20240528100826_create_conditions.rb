class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.integer :type, null: false, default: 0
      t.integer :value, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
