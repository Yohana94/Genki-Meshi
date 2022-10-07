class Admins::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to admins_recipes, notice: "レシピを削除しました。"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :image, :body)
  end
end
