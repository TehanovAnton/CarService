# frozen_string_literal: true

class CreateMechanicServices < ActiveRecord::Migration[6.1]
  def change
    create_table :mechanic_services do |t|
      t.integer :mechanic_id, null: false
      t.integer :service_id, null: false

      t.timestamps
    end
  end
end
