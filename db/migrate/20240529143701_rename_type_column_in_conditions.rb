class RenameTypeColumnInConditions < ActiveRecord::Migration[7.0]
  def change
    rename_column :conditions, :type, :condition_type
  end
end
