# frozen_string_literal: true

FactoryBot.define do
  factory :teammate, parent: :user do
    initialize_with { Teammate.new }
  end
end
