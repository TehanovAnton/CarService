class RemoveOrdersServiceId < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :service_id
  end
end
