# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Food truck seed

FoodTruck.destroy_all

10.times do |foodtruck|
  foodtruck = FoodTruck.new({
    name: Faker::Restaurant.name,
    category: FoodTruck::CATEGORY.sample,
    price: Faker::Number.within(range: 100..1000),
    city: "Lausanne",
    description: Faker::Lorem.paragraph
  })
  foodtruck.save!
end
