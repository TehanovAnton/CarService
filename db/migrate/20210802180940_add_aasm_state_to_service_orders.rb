class AddAasmStateToServiceOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :aasm_state, :string
  end
end
