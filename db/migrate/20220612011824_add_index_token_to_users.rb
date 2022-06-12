class AddIndexTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :token
  end
end
