# frozen_string_literal: true

class Client < User
  has_many :orders, dependent: :destroy
  has_many :mechanics, through: :orders
end
