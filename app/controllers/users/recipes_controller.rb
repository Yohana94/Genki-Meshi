class Users::RecipesController < ApplicationController
  def index
     if params[:genre_id].present?
       genre = Genre.find(params[:genre_id])
       @recipes = genre.recipes.page(params[:page]).per(6)
     else
       @recipes = Recipe.where.not(admin_id: nil)
       @recipes = @recipes.page(params[:page]).per(6)
     end
     if params[:search].present?
       @recipes = Recipe.searchby(params[:search])
       @recipes = @recipes.page(params[:page]).per(6)
     end
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to users_recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
     @recipes = Recipe.search(params[:search])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id])
    user = recipe.user
    recipe.destroy
    redirect_to users_user_path(user.id), notice: "レシピを削除しました。"
  end

 def recipe_params
    params.require(:recipe).permit(:recipe_name, :image, :body, :nutrition, :genre_id, :composition)
 end
end
