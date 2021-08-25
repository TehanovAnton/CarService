class Client < User
  has_many :orders
  has_many :mechanics, through: :orders
end
