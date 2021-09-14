# frozen_string_literal: true

class FixCreateServiceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :service_orders do |t|
      t.string :state, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
