class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :update, :destroy]
    
    def index
       @recipe = Recipe.all
       json_response_index(@recipe)
    end
    
    def show
        json_response_show(@recipe)
    end
    
    def create
        @recipe = Recipe.create!(recipe_params)
        json_response(@recipe)
    end
    
    def delete
        @recipe.destroy
        head :no_content
    end
    
    def update
        @recipe.update(recipe_params)
        head :no_content
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
