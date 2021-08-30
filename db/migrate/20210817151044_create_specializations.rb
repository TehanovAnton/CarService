# frozen_string_literal: true

class CreateSpecializations < ActiveRecord::Migration[6.1]
  def change
    create_table :specializations do |t|
      t.integer :service_id, null: false
      t.integer :mechanic_id, null: false

      t.timestamps
    end
  end
end
