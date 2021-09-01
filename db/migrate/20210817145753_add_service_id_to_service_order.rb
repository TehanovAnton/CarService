# frozen_string_literal: true

class AddServiceIdToServiceOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :service_id, :integer, null: false
  end
end
