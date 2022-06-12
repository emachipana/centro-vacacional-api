class AddColumnStayToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :stay, :integer, default: 0
  end
end
