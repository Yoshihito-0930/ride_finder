class CreateVisitCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_categories do |t|
      t.integer :name, null: false

      t.timestamps
    end
  end
end
