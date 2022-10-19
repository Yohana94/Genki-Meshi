class Users::CalorieDentakusController < ApplicationController
  def index
    arr = []
    # params.each do |key, value|
    #   if key.split("-").length == 2
    #   arr.push([  key.split("-")[1] , value ])
    # end
    # end
    items = params[:ingredients]
    items.each do |item|
      # binding.pry
      ingredient = Ingredient.find(item[:ingredient_id])
     arr.push(item[:amount].to_i * ingredient.calorie)
    end

    @ingredients = Ingredient.all
    @selected_ingredients = params[:ingredients]
    @total = 0
    # binding.irb

    if params[:ingredients].present?
       params[:ingredients].each do |ingredient|
         @ingredient = Ingredient.find(ingredient[:ingredient_id])
         @ingredient.update(amount: ingredient[:amount].to_i)
         @total += @ingredient.calorie * ingredient[:amount].to_i
      end
    end
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
