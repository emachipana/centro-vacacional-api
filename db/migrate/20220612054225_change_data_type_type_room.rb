class ChangeDataTypeTypeRoom < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :type_room
    add_column :rooms, :type_room, :integer
  end
end
