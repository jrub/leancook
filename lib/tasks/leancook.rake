require 'json'

namespace :leancook do
  desc 'Import json data (bbcfood, tastykitchen, thepioneerwoman, williamssonoma)'
  task import: :environment do
    Recipe.delete_all
    data = File.read('data/bbcfood.json')
    create_recipes(data)
    data = File.read('data/tastykitchen.json')
    create_recipes(data)
    data = File.read('data/thepioneerwoman.json')
    create_recipes(data)
    data = File.read('data/williamssonoma.json')
    create_recipes(data)
  end

  desc 'Export json data'
  task export: :environment do
    puts "\n Export which source? (eg: williamssonoma, thepioneerwoman...)t"
    answer = STDIN.gets.chomp
    File.open("./data/"+answer+".json", 'w') { |file| file.write(Recipe.where(:source => answer).to_json) }
  end

  desc 'Reindex data'
  task reindex: :environment do
    Recipe.import
  end
end

def create_recipes(data)
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
      recipe.source = object['source']
      recipe.save
    end
end