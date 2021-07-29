class CreateServiceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :service_orders do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
