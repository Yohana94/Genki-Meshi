class Users::MyMemoController < ApplicationController
  def show
   @ingredients = Ingredient.all
  end

  def destroy
    ingredient = Ingredient.find_by_id(params[:id])
    ingredient.destroy
    redirect_to users_my_memo_path, notice: "レシピを削除しました。"
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :calorie, :amount)
  end
end
