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
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
    flash[:notice]="You have updated book successfully."
    redirect_to admins_recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    redirect_to admins_recipes_path, notice: "レシピを削除しました。"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :image, :body, :nutrition, :ingredient)
  end
end
