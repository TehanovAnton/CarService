# frozen_string_literal: true

class AddforeignKeyOnServiceIdServiceOrder < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :service_orders, :services, column: :service_id, primar_key: :id
  end
end
