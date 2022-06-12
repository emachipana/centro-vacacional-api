class AddIndexUniqDniToClient < ActiveRecord::Migration[7.0]
  def change
    add_index :clients, :DNI, unique: true
  end
end
