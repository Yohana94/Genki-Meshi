class Users::RecipesController < ApplicationController
  def index
     if params[:genre_id].present?
       genre = Genre.find(params[:genre_id])
       @recipes = genre.recipes
     else
       @recipes = Recipe.all.select { |recipe| recipe.admin_id != nil }
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

   def recipe_params
    params.require(:recipe).permit(:recipe_name, :image, :body, :nutrition, :genre_id, :composition)
  end
end
