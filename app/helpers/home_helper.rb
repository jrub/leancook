module HomeHelper
  def query_value(query)
    query == '*' ? '' : query
  end

  def cook_mins(recipe)
    cook_time = recipe.cookTime
    if cook_time
      mins = cook_time.scan(/\d+M/).first
      hours = cook_time.scan(/\d+H/).first
      if mins or hours
        cook_mins = (mins ? mins.chomp.to_i : 0)
        cook_mins = cook_mins + (hours ? hours.chomp.to_i : 0) * 60
        "<span class='value'>#{cook_mins}</span><span class='label'>min</span>"
      end
    end
  end
end
