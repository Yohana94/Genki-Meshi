class Users::MyMemoController < ApplicationController
  def show
   @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :calorie, :amount)
  end
end
