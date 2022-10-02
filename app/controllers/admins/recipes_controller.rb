class Admins::RecipesController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # byebug
    recipe = Recipe.new(recipe_params)
    recipe.admin_id = current_admin.id
    recipe.save
    redirect_to admins_homes_top_path
  end

  def update
  end

  def show
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :image, :body)
  end
end
