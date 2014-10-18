class HomeController < ApplicationController
  def index
  end

  def search
    @query = params[:query].presence || '*'

    @recipes = Recipe.search @query
  end
end
