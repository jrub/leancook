module HomeHelper
  def query_value(query)
    query == '*' ? '' : query
  end
end
