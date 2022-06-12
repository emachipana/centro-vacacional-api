class RenameColumnTypeToTypeRoom < ActiveRecord::Migration[7.0]
  def change
      rename_column :rooms, :type, :type_room
  end
end
