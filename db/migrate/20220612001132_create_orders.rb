class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :food, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :place, default: 0
      t.integer :state, default: 0
      t.boolean :paid, default: false
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
