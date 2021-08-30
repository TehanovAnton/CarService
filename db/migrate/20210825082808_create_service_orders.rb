# frozen_string_literal: true

class CreateServiceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :service_orders do |t|
      t.integer :order_id, null: false
      t.integer :service_id, null: false

      t.timestamps
    end
  end
end
