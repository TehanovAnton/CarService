# frozen_string_literal: true
require 'elasticsearch/model'

class Client < User
  include Elasticsearch::Model

  has_many :orders, dependent: :destroy
  has_many :mechanics, through: :orders

  def no_orders?
    orders.empty?
  end
end

Client.__elasticsearch__.create_index!
