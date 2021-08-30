# frozen_string_literal: true

class Specialization < ApplicationRecord
  belongs_to :mechanic
  belongs_to :service
end
