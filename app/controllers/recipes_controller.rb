class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipes_path
        else
            render :edit
        end
    end

    def delete

    end


    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end