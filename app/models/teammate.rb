# frozen_string_literal: true

class Teammate < User
  has_many :positions, dependent: :destroy

  def confirmation_required?
    false
  end
end
