class AddMechanicIdToServiceorders < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :mechanic_id, :integer, null: false
  end
end
