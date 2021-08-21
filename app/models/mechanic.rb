class Mechanic < User

  has_many :orders
  has_many :users, through: :orders

  has_many :specializations, dependent: :destroy
  has_many :services, through: :specializations

  protected
  def confirmation_required?
    false
  end
end
