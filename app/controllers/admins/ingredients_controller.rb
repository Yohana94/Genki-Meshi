class Admins::IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredients = Ingredient.new(ingredient_params)
    if @ingredients.save
      redirect_to admins_ingredients_path
    else
      render :new
    end
  end

  def index
    @ingredients = Ingredient.all
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :image, :calorie)
  end
end
