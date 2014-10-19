require 'json'

namespace :leancook do
  desc 'Import json data'
  task import: :environment do
    data = File.read('data/mini.json')
    json = JSON.parse(data)
    Recipe.delete_all
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

  desc 'Export json data'
  task export: :environment do
    puts "\n Export which source? (eg: williamssonoma, thepioneerwoman...)t"
    answer = STDIN.gets.chomp
    File.open("./data/"+answer+".json", 'w') { |file| file.write(Recipe.where(:source => answer).to_json) }
  end

  desc 'Reindex data'
  task reindex: :environment do
    Recipe.reindex
  end
end
