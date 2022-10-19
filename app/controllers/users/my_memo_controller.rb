class Users::MyMemoController < ApplicationController
  def show
    # binding.pry
   @ingredients = Ingredient.all
  end

  def destroy
    # binding.pry
    ingredient = Ingredient.find(params[:id])
    # ingredient.destroy
    #ingredient.amount = 0
     ingredient.update(amount: 0)
    redirect_to users_my_memo_path(current_user.id), notice: "レシピを削除しました。"
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :calorie, :amount)
  end
end
