class HomeController < ApplicationController
  def index
  end

  def search
    @query = params[:query].presence || '*'

    @recipes = Recipe.search_by_ingredients @query
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
    end
  end

  def about
  end
end
