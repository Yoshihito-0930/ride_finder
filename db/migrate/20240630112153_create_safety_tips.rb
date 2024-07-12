class CreateSafetyTips < ActiveRecord::Migration[7.0]
  def change
    create_table :safety_tips do |t|
      t.text :content

      t.timestamps
    end
  end
end
