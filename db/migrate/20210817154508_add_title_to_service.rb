# frozen_string_literal: true

class AddTitleToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :title, :string, null: false
  end
end
