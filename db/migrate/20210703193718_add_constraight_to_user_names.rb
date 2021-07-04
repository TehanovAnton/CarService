# frozen_string_literal: true

class AddConstraightToUserNames < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :first_name, false
  end
end
