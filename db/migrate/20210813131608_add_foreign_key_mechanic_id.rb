# frozen_string_literal: true

class AddForeignKeyMechanicId < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :service_orders, :users, column: :mechanic_id, primary_key: :id
  end
end
