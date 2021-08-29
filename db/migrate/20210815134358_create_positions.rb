# frozen_string_literal: true

class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :position

      t.timestamps
    end
  end
end
