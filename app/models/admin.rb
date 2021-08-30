# frozen_string_literal: true

class Admin < User
  protected

  def confirmation_required?
    false
  end
end
