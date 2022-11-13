class Users::FavoritesController < ApplicationController
before_action :authenticate_user!
  def create
    recipe = Recipe.find(params[:id])
    favorite = current_user.favorites.new(recipe_id: recipe.id)
    favorite.save!
    redirect_to users_recipe_path(recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to users_recipe_path(recipe)
  end
end
