# frozen_string_literal: true

FactoryBot.define do
  factory :teammate do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.free_email }
    phone_number { Faker::PhoneNumber.cell_phone_with_country_code }
    password { 'ewqqwe' }
  end
end
