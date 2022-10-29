class Admins::RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page]).per(1)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_admin.recipes.new(recipe_params)
    if @recipe.save
      redirect_to admins_homes_top_path
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:notice]="You have updated recipe successfully."
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
    params.require(:recipe).permit(:recipe_name, :image, :body, :nutrition, :genre_id, :composition)
  end
end
