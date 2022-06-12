class ChangeDataTypeTypeFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :type_food
    add_column :foods, :type_food, :integer
end
end
