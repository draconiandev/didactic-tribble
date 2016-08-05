# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Destination.create(name: 'Coorg', description: "Mysore (or Mysuru), a city in India's Karnataka state, was the capital of the Kingdom of Mysore from 1399-1947. In its center is opulent Mysore Palace, former seat of the ruling Wodeyar dynasty. The palace blends Hindu, Islamic, Gothic and Rajput styles, and is dramatically lit at night. Mysore is also home to the centuries-old Devaraja Market, filled with spices, silk and sandalwood.",
#                    meta_description: "The palace blends Hindu, Islamic, Gothic and Rajput styles, and is dramatically lit at night.",
#                    cover: { File.open("#{Rails.root}/spec/fixtures/files/card.jpg")})
Person.create(name: 'Pavan', email: 'pavan@trekhub.in', password: 'pavanp12', password_confirmation: 'pavanp12', role: 'admin')
Person.create(name: 'Abhishek', email: 'abhishek@trekhub.in', password: 'abhishek12', password_confirmation: 'abhishek12', role: 'admin')
Person.create(name: 'Shomika', email: 'shomika@trekhub.in', password: 'shomika12', password_confirmation: 'shomika12', role: 'admin')