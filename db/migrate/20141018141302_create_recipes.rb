class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.string :url
      t.string :image
      t.string :cookTime
      t.string :prepTime

      t.timestamps null: false
    end
  end
end
