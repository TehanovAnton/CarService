# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :price, null: false
      t.integer :service_order_id, null: false

      t.timestamps
    end
  end
end
