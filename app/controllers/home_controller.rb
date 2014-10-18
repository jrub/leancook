class HomeController < ApplicationController
  def index
  end

  def search
    @recipes = if params[:query].present?
                 Recipe.search params[:query]
               else
                 Recipe.all
               end
  end
end
