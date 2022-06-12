class AddIndexUniqEmailToClient < ActiveRecord::Migration[7.0]
  def change
    add_index :clients, :email, unique: true
  end
end
