class Recipe < ActiveRecord::Base
  searchkick

  def self.search_by_ingredients(query)
    search(
      query,
      fields: [:name, 'ingredients^10', :description]
    )
  end
end
