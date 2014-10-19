class Recipe < ActiveRecord::Base
  include Elasticsearch::Model

  def self.search_by_ingredients(query)
    search(
      query: {
        multi_match: {
          query: query,
          fields: [:name, 'ingredients^10', :description]
        }
      }
    )
  end
end
