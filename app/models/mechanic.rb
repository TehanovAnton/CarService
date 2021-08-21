class Mechanic < User

  has_many :orders

  protected
  def confirmation_required?
    false
  end
end
