class Recipe < ActiveRecord::Base
  include Elasticsearch::Model
  
  paginates_per 15

  def self.search_by_ingredients(query)
    search(
      query: {
        multi_match: {
          query: query,
          fuzziness: 2,
          fields: [:name, 'ingredients^10', :description],
          minimum_should_match: '70%',
          cutoff_frequency: 0.1
        }
      }
    )
  end
end
