class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :beds_number
      t.float :price, default: 0
      t.boolean :state, default: true
      t.string :type
      t.integer :num_room
      t.text :description

      t.timestamps
    end
  end
end
