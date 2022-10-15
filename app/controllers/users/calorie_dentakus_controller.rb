class Users::CalorieDentakusController < ApplicationController
  def index
    arr = []
    params.each do |key, value|
      if key.split("-").length == 2
       arr.push([  key.split("-")[1] , value ])
     end
    end
    @ingredients = arr

  end

  def destroy
    ingredient = Ingredient.find_by_id(params[:id])
    ingredient.destroy
    redirect_to users_my_memo_path, notice: "レシピを削除しました。"
  end

  private

  def calorie_dentaku_params
    params.require(:calorie_dentaku).permit(:calorie, :amount, :ingredient_name)
  end
end
