# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Database! 🧹"

Camel.destroy_all

puts "Database is clean! 🧼"

puts "Creating Camels... 🐫"

all_desctription = [
  "dromedary",
  "bactrian camel",
  "hybrid camel",
  "wild bactrian camel",
  "cama"]

all_purpose = [
  "movie production",
  "desert trip",
  "race",
  "photo shoot",
  "birthday party",
  "fair",
  "present",
  "wedding"]

10.times do
  camel = Camel.create!(
    name: Faker::FunnyName.name,
    age: rand(1..41),
    description: all_desctription.sample,
    price: rand(1000..10_000),
    city: Faker::Address.country,
    purpose: all_purpose.sample,
    user: User.first
  )
  puts "Camel #{camel.id} is created 🐫🐫🐫🐫🐫🐫🐫"
end

puts "Amazing! We are done 🐫"
