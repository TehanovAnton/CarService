# frozen_string_literal: true

FactoryBot.define do
  factory :admin, parent: :user do
    initialize_with { Admin.new }
  end
end
