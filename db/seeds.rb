# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def generate_user_attributes
  first_name = Faker::Name.first_name
  last_name = Faker::Name.unique.last_name
  email = Faker::Internet.unique.free_email(name: last_name)
  phone_number = Faker::PhoneNumber.cell_phone_with_country_code

  {
    last_name: last_name,
    first_name: first_name,
    email: email,
    phone_number: phone_number,
    password: 'ewqqwe'
  }
end

Admin.create(generate_user_attributes)
User.create(generate_user_attributes)

positions = ['Chief Executive officer', 'Product Manager', 'Chief Engineer', 'Accountant']
positions.each do |position|
  teamate = Teammate.create(generate_user_attributes)

  Position.create(position: position, teammate_id: teamate.id)
end

services_attributes = [
  { title: 'rubber replacement', price: 10 },
  { title: 'technical inspectation', price: 15 },
  { title: 'renovation work', price: 20 },
  { title: 'replacement of parts', price: 10 }
]

services = services_attributes.map do |service_attributes|
  Service.create(service_attributes)
end

def mechanic_params(mechanic_services)
  mechanic_services = [mechanic_services] unless mechanic_services.is_a?(Array)
  mechanic_services_attributes = mechanic_services.map { |service| { service_id: service.id } }

  {
    **generate_user_attributes,
    mechanic_services_attributes: mechanic_services_attributes
  }
end

services.each_slice(2) do |mechanic_services|
  Mechanic.create(mechanic_params(mechanic_services))
end
