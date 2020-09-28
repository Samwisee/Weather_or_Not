# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Freetime.destroy_all
User.destroy_all
Forecast.destroy_all
Location.destroy_all

locations = [
  { name: 'Melbourne', lat: 46.47, lon: 18.83 }
]
Location.create(locations)

puts "Database clean"

