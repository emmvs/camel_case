# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


puts "Cleaning Database! 🧹"

Camel.destroy_all if Rails.env.development?

puts "Database is clean! 🧼"

puts "Creating Camels... 🐫🐫🐫🐫🐫🐫🐫"

all_desctription = [
  "dromedary",
  "bactrian camel",
  "hybrid camel",
  "wild bactrian camel",
  "cama",
  ]

all_purpose = [
  "movie production",
  "desert trip",
  "race",
  "photo shoot",
  "birthday party",
  "fair",
  "present",
  "wedding"]

e = 0

10.times do
  camel = Camel.create!(
    name: Faker::FunnyName.name,
    age: rand(1..41),
    description: all_desctription.sample,
    price: rand(1_000..10_000),
    city: Faker::Address.country,
    purpose: all_purpose.sample,
    user: User.first
  )
  photo = URI.open('https://source.unsplash.com/collection/9894242')
  camel.photo.attach(io: photo, filename: "camel#{e}.png", content_type: 'image/png')
  camel.sku = "camel#{e}"
  camel.save!
  puts "Camel #{camel.id} is created 🐫"
  e = e + 1
end

puts "Amazing! We are done 🐫"
