# frozen_string_literal: true

class AddResetPasswordSentAt < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_sent_at, :datetime
  end
end
