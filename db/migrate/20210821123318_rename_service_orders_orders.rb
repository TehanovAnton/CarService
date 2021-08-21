class RenameServiceOrdersOrders < ActiveRecord::Migration[6.1]
  def change
    rename_table :service_orders, :orders
  end
end
