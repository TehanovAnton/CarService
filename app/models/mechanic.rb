class Mechanic < User

  has_many :service_orders

  protected
  def confirmation_required?
    false
  end
end
