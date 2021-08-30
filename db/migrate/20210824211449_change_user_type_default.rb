# frozen_string_literal: true

class ChangeUserTypeDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :type, 'Client'
  end
end
