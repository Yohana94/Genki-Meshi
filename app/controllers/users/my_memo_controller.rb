class Users::MyMemoController < ApplicationController
  def show
    # binding.pry
   current_user.recipes.pluck(:ingredient_id)
   ingredient_ids = current_user.mymemos.map do |mymemo|
    mymemo.ingredients.ids
   end.flatten.uniq
   # ingredient_ids => [1,2,3,4,5]  [12, 13, 14, 15, 16, 17]
   @ingredients = Ingredient.where(id: ingredient_ids)
  end

  def destroy
    # binding.pry
    ingredient = Ingredient.find(params[:id])
    # ingredient.destroy
    ingredient.update(amount: 0)
    redirect_to users_my_memo_path(current_user.id), notice: "レシピを削除しました。"
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :calorie, :amount)
  end
end
