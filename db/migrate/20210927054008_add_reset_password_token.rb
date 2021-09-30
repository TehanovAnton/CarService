# frozen_string_literal: true

class AddResetPasswordToken < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_token, :string
  end
end
