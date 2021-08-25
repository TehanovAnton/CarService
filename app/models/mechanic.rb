class Mechanic < User

  has_many :orders
  has_many :services

  protected
  def confirmation_required?
    false
  end
end
