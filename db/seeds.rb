# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Kitten.create([
  { name: "Musmus", age: 3, cuteness: "So cute!", softness: "Too soft! <3" },
  { name: "Lungey", age: 1, cuteness: "Dark cute!", softness: "squishy <3" },
  { name: "Momo", age: 2, cuteness: "Snow White", softness: "Silky Smooth Soft" }
])