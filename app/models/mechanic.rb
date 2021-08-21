class Mechanic < User

  has_many :service_orders
  has_many :users, through: :service_orders

  has_many :specializations, dependent: :destroy
  has_many :services, through: :specializations

  protected
  def confirmation_required?
    false
  end
end
