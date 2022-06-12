class AddIndexNumRoomUniqToRoom < ActiveRecord::Migration[7.0]
  def change
    add_index :rooms, :num_room, unique: true
  end
end
