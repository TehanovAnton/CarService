class Mechanic < User
  protected
  def confirmation_required?
    false
  end
end
