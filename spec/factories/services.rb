# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    title { Faker::Commerce.unique.product_name }
    price { Faker::Commerce.price }

    trait :rubber_replacement do
      title { 'rubber_replacement' }
    end
  end
end
