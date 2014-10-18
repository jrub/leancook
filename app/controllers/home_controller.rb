class HomeController < ApplicationController
  def index
  end

  def search
    @recipes = Recipe.limit(15)
  end
end
