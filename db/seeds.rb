# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

result = RestClient.get 'https://forkify-api.herokuapp.com/api/v2/recipes?search=pizza'
recipes = JSON.parse(result)['data']['recipes']
puts "fetch #{recipes.length} recipes\n"
recipes_attributes = recipes.map do |recipe|
  puts "fetch recipe #{recipe['id']}\n"
  recipe_result = RestClient.get "https://forkify-api.herokuapp.com/api/v2/recipes/#{recipe['id']}"
  recipe_data = JSON.parse(recipe_result)['data']['recipe']
  {
    cooking_time: recipe_data['cooking_time'],
    image_url: recipe_data['image_url'],
    publisher: recipe_data['publisher'],
    servings: recipe_data['servings'],
    source_url: recipe_data['source_url'],
    title: recipe_data['title'],
    ingredients_attributes: recipe_data['ingredients']
  }
end
Recipe.create(recipes_attributes)
