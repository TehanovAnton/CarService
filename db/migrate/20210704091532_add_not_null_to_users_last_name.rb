# frozen_string_literal: true

class AddNotNullToUsersLastName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :last_name, false
  end
end
