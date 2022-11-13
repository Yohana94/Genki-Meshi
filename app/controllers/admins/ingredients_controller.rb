# frozen_string_literal: true

class Admins::IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save!
      redirect_to admins_ingredients_path
    else
      render :new
    end
  end

  def index
    @ingredients = Ingredient.page(params[:page]).per(8)
  end

  def destroy
    ingredient = Ingredient.find_by_id(params[:id])
    ingredient.destroy
    redirect_to admins_ingredients_path, notice: "材料を削除しました。"
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:ingredient_name, :image, :calorie)
    end
end
