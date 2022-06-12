class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.integer :DNI
      t.integer :expenses, default: 0
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
