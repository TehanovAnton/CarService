# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(first_name: 'admin', last_name: 'adminov', phone_number: '911', email: 'admin@gmail.com', password: 'ewqqwe')
User.create(first_name: 'Anton', last_name: 'Tehanov', phone_number: '1234', email: 'tehanovanton@gmail.com', password: 'ewqqwe')

positions = ['Chief Executive officer', 'Product Manager', 'Chiefe Engineer', 'Accountant']
4.times do |i|
  last_name = Faker::Name.unique.last_name

  teamate = Teammate.create(first_name: Faker::Name.first_name,
                            last_name: last_name,
                            phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
                            email: Faker::Internet.unique.free_email(name: last_name),
                            password: 'ewqqwe')

  p = Position.create(position: positions[i], teammate_id: teamate.id)  
end

rubber_replacement = Service.create(title: 'rubber replacement', price: 10)
technical_inspectation = Service.create(title: 'technical inspectation', price: 15)
renovation_work = Service.create(title: 'renovation work', price: 20)
replacement_of_parts = Service.create(title: 'replacement of parts', price: 10)
services = [rubber_replacement, technical_inspectation, renovation_work, replacement_of_parts]

4.times do |e|
  last_name = Faker::Name.unique.last_name

  mechanic = Mechanic.create(first_name: Faker::Name.first_name,
                             last_name: last_name,
                             phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
                             email: Faker::Internet.unique.free_email(name: last_name),
                             password: 'ewqqwe')
  

  2.times do
    MechanicService.create(mechanic_id: mechanic.id,
                           service_id: services[Faker::Number.unique.between(from: 0, to: services.count - 1)].id)
  end

  Faker::Number.unique.clear
end
