# frozen_string_literal: true

class AddDescriptionToServiceOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :description, :string
  end
end
