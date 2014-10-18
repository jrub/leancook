class HomeController < ApplicationController
  def index
  end

  def search
    @query = params[:query].blank? ? '*' : params[:query]

    @recipes = Recipe.search @query
  end
end
