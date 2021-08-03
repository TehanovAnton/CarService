class RemoveStateFromServiceOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :service_orders, :state
  end
end
