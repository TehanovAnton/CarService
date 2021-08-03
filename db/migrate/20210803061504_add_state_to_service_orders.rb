class AddStateToServiceOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :state, :string, default: 'accepted', null: false
  end
end
