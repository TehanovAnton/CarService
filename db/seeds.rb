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

Mechanic.create(first_name: 'Wilson', last_name: 'mech', phone_number: '911', email: 'wilsonmech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Koner', last_name: 'mech', phone_number: '191', email: 'Konermech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Rayn', last_name: 'mech', phone_number: '119', email: 'Raynmech@gmail.com', password: 'ewqqwe')

Teammate.create(first_name: 'Walter', last_name: 'White', phone_number: '119', email: 'walterwhiteh@gmail.com', password: 'ewqqwe')
Teammate.create(first_name: 'Sara', last_name: 'Jhonson', phone_number: '191', email: 'sarajhonson@gmail.com', password: 'ewqqwe')
Teammate.create(first_name: 'William', last_name: 'Anderson', phone_number: '911', email: 'williamanderson@gmail.com', password: 'ewqqwe')
Teammate.create(first_name: 'Amanda', last_name: 'Jepson', phone_number: '119', email: 'amandajepson@gmail.com', password: 'ewqqwe')

Position.create(position: 'Chief Executive officer', teammate_id: Teammate.find_by(email: 'walterwhiteh@gmail.com').id)
Position.create(position: 'Product Manager', teammate_id: Teammate.find_by(email: 'sarajhonson@gmail.com').id)
Position.create(position: 'Chiefe Engineer', teammate_id: Teammate.find_by(email: 'williamanderson@gmail.com').id)
Position.create(position: 'Accountant', teammate_id: Teammate.find_by(email: 'amandajepson@gmail.com').id)

Service.create( title: 'ruber replacement', price: 10)