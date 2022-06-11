class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price, default: 0
      t.integer :amount, default: 0
      t.text :description
      t.boolean :primer, default: false
      t.string :type
      t.boolean :state, default: true

      t.timestamps
    end
  end
end
