class RenameColumnTypeToFoodType < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :type, :type_food
  end
end
