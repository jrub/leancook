class HomeController < ApplicationController
  def index
  end

  def search
    @query = params[:query].presence || '*'

    @recipes = Recipe.search_by_ingredients(@query).page(params[:page])
    respond_to do |format|
      if request.xhr?
        if params[:page]
          format.html { render :partial => 'recipes_list' }
        else
          format.html { render layout: false }
        end
      else
        format.html { render layout: true }
      end
    end
  end

  def about
  end
end
