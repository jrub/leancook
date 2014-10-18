require 'json'

namespace :leancook do
  desc "Import json data"
  task import: :environment do
    data = File.read("data/mini.json")
    json = JSON.parse(data)
    json.each do |object|
      recipe = Recipe.new
      recipe.name = object['name']
      recipe.description = object['description']
      recipe.ingredients = object['ingredients']
      recipe.url = object['url']
      recipe.image = object['image']
      recipe.cookTime = object['cookTime']
      recipe.prepTime = object['prepTime']
      recipe.save
    end
  end

  desc 'Reindex data'
  task reindex: :environment do
    Recipe.reindex
  end
end
