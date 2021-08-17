class Service < ApplicationRecord
  has_many :service_orders
  
  has_many :specializations
  has_many :mechanics, through: :specializations
end
