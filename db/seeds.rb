# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Create ingredients, cocktails, and doses"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  ingredient_name = ingredient["strIngredient1"]
  cocktail_name = "Cocktail with #{ingredient_name}!"
  i = Ingredient.new(name: ingredient_name)
  i.save
  c = Cocktail.new(name: cocktail_name)
  i.save
  d = Dose.new(description: "Dose for #{c.name} / #{i.name} !", cocktail: c, ingredient: i)
  puts "create #{i.name}, #{c.name}, #{d.description}"
end
