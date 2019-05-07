# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
10.times do
  password = Faker::Internet.password
  User.create(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::StarWars.planet,
    description: Faker::TvShows::BojackHorseman.quote,
    email: Faker::Name.first_name + "@yopmail.com",
    password: password,
    password_confirmation: password,
    encrypted_password: Faker::Internet.password
  )
end
User.create(  first_name: Faker::Movies::LordOfTheRings.character,  last_name: Faker::Movies::StarWars.planet,  description: Faker::TvShows::BojackHorseman.quote,  email: "mwah6@yopmail.com",  password: "123456", password_confirmation: "123456")

Event.destroy_all
10.times do
  Event.create(
    start_date: Faker::Date.forward(23), duration: (rand(1..120)*5), title: Faker::Movies::StarWars.planet, description: Faker::TvShows::BojackHorseman.quote, price: rand(1..1000), location: Faker::Movies::LordOfTheRings.character, administrator: User.all.sample
  )
end

Attendance.destroy_all
30.times do
  Attendance.create(user: User.all.sample, event: Event.all.sample)
end
