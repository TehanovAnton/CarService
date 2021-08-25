class Mechanic < User

  has_many :orders

  has_many :mechanic_services
  has_many :services, through: :mechanic_services

  protected
  def confirmation_required?
    false
  end
end
