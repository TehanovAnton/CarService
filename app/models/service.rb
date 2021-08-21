class Service < ApplicationRecord
  has_many :orders
  
  has_many :specializations
  has_many :mechanics, through: :specializations
end
