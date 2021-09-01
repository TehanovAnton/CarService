# frozen_string_literal: true

class MechanicService < ApplicationRecord
  belongs_to :mechanic
  belongs_to :service
end
