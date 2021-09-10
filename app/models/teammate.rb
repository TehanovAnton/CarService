# frozen_string_literal: true

class Teammate < User
  def confirmation_required?
    false
  end
end
