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

Service.create(title: 'rubber replacement', price: 10)
Service.create(title: 'technical inspectation', price: 15)
Service.create(title: 'renovation work', price: 20)
Service.create(title: 'replacement of parts', price: 10)

Mechanic.create(first_name: 'Wilson', last_name: 'mech', phone_number: '911', email: 'wilsonmech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Koner', last_name: 'mech', phone_number: '191', email: 'konermech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Rayn', last_name: 'mech', phone_number: '119', email: 'raynmech@gmail.com', password: 'ewqqwe')