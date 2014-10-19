module HomeHelper
  def query_value(query)
    query == '*' ? '' : query
  end

  def cook_mins(recipe)
    cook_time = recipe.cookTime
    if cook_time
      mins = cook_time.scan(/\d+/)
      if mins.count > 0
        cook_mins = mins.first.to_i
        if cook_time.last == 'H'
          cook_mins = cook_mins * 60
        end
        "<span class='value'>#{cook_mins}</span><span class='label'>min</span>"
      end
    end
  end
end
