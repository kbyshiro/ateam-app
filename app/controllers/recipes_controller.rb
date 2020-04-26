class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :update, :destroy]
    
    def index
      @recipe = Recipe.all
      json_response(@recipe)
    end
    
    def show
      json_response(@recipe)
    end
    
    def create
      @recipe = Recipe.create!(recipe_params)
      json_response(@recipe)
    end
    
    def delete
      @recipe.destroy
      json_response(@recipe)
    end
    
    def update
      @recipe.update(recipe_params)
      json_response(@recipe)
    end
    
    private
    
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
        params.permit(:title,
                      :making_time,
                      :serves,
                      :ingredients,
                      :cost)
    end
end
