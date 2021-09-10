# frozen_string_literal: true

FactoryBot.define do
  factory :client, parent: :user do
    initialize_with { Client.new }

    trait :tehanov_anton_email do
      email { 'tehanovanton@gmail.com' }
    end
  end
end
