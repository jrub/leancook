class Recipe < ActiveRecord::Base
  include Elasticsearch::Model

  def self.search_by_ingredients(query)
    search(
      query: {
        match: {
          ingredients: {
            query: query
          }
        }
      }
    )
  end
end
