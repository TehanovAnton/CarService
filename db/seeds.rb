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


teammate_walter_white = Teammate.create(first_name: 'Walter', last_name: 'White', phone_number: '119', email: 'walterwhiteh@gmail.com', password: 'ewqqwe')
Position.create(position: 'Chief Executive officer', teammate_id: teammate_walter_white.id)

teammate_sara_jhonson = Teammate.create(first_name: 'Sara', last_name: 'Jhonson', phone_number: '191', email: 'sarajhonson@gmail.com', password: 'ewqqwe')
Position.create(position: 'Product Manager', teammate_id: teammate_sara_jhonson.id)

teammate_william_anderson = Teammate.create(first_name: 'William', last_name: 'Anderson', phone_number: '911', email: 'williamanderson@gmail.com', password: 'ewqqwe')
Position.create(position: 'Chiefe Engineer', teammate_id: teammate_william_anderson.id)

teammate_amanda_jepson = Teammate.create(first_name: 'Amanda', last_name: 'Jepson', phone_number: '119', email: 'amandajepson@gmail.com', password: 'ewqqwe')
Position.create(position: 'Accountant', teammate_id: teammate_amanda_jepson.id)


rubber_replacement = Service.create(title: 'rubber replacement', price: 10)
technical_inspectation = Service.create(title: 'technical inspectation', price: 15)
renovation_work = Service.create(title: 'renovation work', price: 20)
replacement_of_parts = Service.create(title: 'replacement of parts', price: 10)

wilsonmech = Mechanic.create(first_name: 'Wilson', last_name: 'mech', phone_number: '911', email: 'wilsonmech@gmail.com', password: 'ewqqwe')
MechanicService.create(mechanic_id: wilsonmech.id, service_id: rubber_replacement.id)
MechanicService.create(mechanic_id: wilsonmech.id, service_id: technical_inspectation.id)

konermech = Mechanic.create(first_name: 'Koner', last_name: 'mech', phone_number: '191', email: 'konermech@gmail.com', password: 'ewqqwe')
MechanicService.create(mechanic_id: konermech.id, service_id: technical_inspectation.id)
MechanicService.create(mechanic_id: konermech.id, service_id: renovation_work.id)

raynmech = Mechanic.create(first_name: 'Rayn', last_name: 'mech', phone_number: '119', email: 'raynmech@gmail.com', password: 'ewqqwe')
MechanicService.create(mechanic_id: raynmech.id, service_id: renovation_work.id)
MechanicService.create(mechanic_id: raynmech.id, service_id: replacement_of_parts.id)