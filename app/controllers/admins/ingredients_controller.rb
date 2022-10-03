class Admins::IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    recipe.admin_id = current_admin.id
    recipe.save
    redirect_to new_admins_ingredient_path
  end

  def index
    @ingredients = Ingredient.all
  end

  private

  def recipe_params
    params.require(:ingredient).permit(:ingredient_name, :image, :calorie)
  end
end
