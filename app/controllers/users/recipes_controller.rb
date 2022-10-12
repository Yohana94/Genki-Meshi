class Users::RecipesController < ApplicationController
  def index
     @recipes = Recipe.all
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to admins_homes_top_path
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def search
     @recipes = Recipe.search(params[:search])
  end
end
