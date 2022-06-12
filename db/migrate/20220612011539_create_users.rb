class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :username, unique: true
      t.string :password_digest
      t.string :token
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
