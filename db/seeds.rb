# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


puts "Cleaning Database! 🧹"

Camel.destroy_all
User.destroy_all

puts "Database is clean! 🧼"

puts "Creating Camels... 🐫🐫🐫🐫🐫🐫🐫"

all_description = [
  "This is an amazing Camel! 🐫",
  "Best Camel ever! It was very slow but I had a good laugh!",
  "Oh my god, I loved this Camel so much!",
  "Camels have always been my favorite animals. Now I finally got the chance to have one on my Birthday Party and it was amazing!",
  "Nasty but fast as hell!",
  "Stubborn but super cute! 🥺",
]

all_type = [
  "Dromedary",
  "Bactrian Camel",
  "Hybrid Camel",
  "Wild bactrian Camel",
  "Cama",
  ]

all_purpose = [
  "Movie production",
  "Desert Trip",
  "Race",
  "Photo Shoot",
  "Birthday Party",
  "Fair",
  "Gift",
  "Wedding"]

e = 0

  User.create!(
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name,
    phone_number: "+491065666789",
    email: "emma@test.com",
    password: "123456",
  )

  User.create!(
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name,
    phone_number: "+491065666789",
    email: "dustin@test.com",
    password: "123456",
  )

10.times do
  camel = Camel.create!(
    name: Faker::FunnyName.name,
    age: rand(1..41),
    description: all_description.sample,
    camel_type: all_type.sample,
    price: rand(1_000..10_000),
    city: Faker::Address.city,
    purpose: all_purpose.sample,
    user: User.first
  )
  photo = URI.open('https://source.unsplash.com/collection/9894242')
  camel.photo.attach(io: photo, filename: "camel#{e}.png", content_type: 'image/png')
  camel.save!
  puts "Camel #{camel.id} is created 🐫"
  e = e + 1
end

puts "Amazing! We are done 🐫"
