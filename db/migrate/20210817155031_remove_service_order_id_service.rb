class RemoveServiceOrderIdService < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :service_order_id
  end
end
