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
 User.create(
   first_name: Faker::Movies::LordOfTheRings.character,
   last_name: Faker::Movies::StarWars.planet,
   description: Faker::TvShows::BojackHorseman.quote,
   email: Faker::Name.first_name + "@yopmail.com",
   encrypted_password: Faker::Internet.password
 )
end
User.create(  first_name: Faker::Movies::LordOfTheRings.character,  last_name: Faker::Movies::StarWars.planet,  description: Faker::TvShows::BojackHorseman.quote,  email: "mwah6@yopmail.com",  encrypted_password: Faker::Internet.password)

Event.create(start_date: Faker::Date.forward(23), duration:30, title: "testdetitre", description: "descriptiondescriptiondescriptiondescription", price: 50, location: "location", administrator: User.all.sample )
create_table "events", force: :cascade do |t|
  t.datetime "start_date"
  t.integer "duration"
  t.string "title"
  t.text "description"
  t.integer "price"
  t.string "location"
  t.bigint "administrator_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["administrator_id"], name: "index_events_on_administrator_id"
end

Attendance.create(user_id: 22, event: Event.all.sample)
