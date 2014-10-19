class Recipe < ActiveRecord::Base
  include Elasticsearch::Model

  def self.search_by_ingredients(query)
    search(
      query: {
        multi_match: {
          query: query,
          fuzziness: 2,
          fields: [:name, 'ingredients^10', :description],
          cutoff_frequency: 0.1
        }
      }
    )
  end
end
