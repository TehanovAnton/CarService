# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(first_name: 'admin', last_name: 'adminov', phone_number: '911', email: 'admin@gmail.com', password: 'ewqqwe')

Mechanic.create(first_name: 'Wilson', last_name: 'mech', phone_number: '911', email: 'wilsonmech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Koner', last_name: 'mech', phone_number: '191', email: 'Konermech@gmail.com', password: 'ewqqwe')
Mechanic.create(first_name: 'Rayn', last_name: 'mech', phone_number: '119', email: 'Raynmech@gmail.com', password: 'ewqqwe')