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

    @ingredients = Ingredient.page(params[:page]).per(6)
    @selected_ingredients = params[:ingredients]
    @total = 0
    # binding.irb

    @resources = [] # 材料のIDと個数をいれる配列
    if params[:ingredients].present?
       params[:ingredients].each do |ingredient|
         @ingredient = Ingredient.find(ingredient[:ingredient_id])
         # @ingredient.update(amount: ingredient[:amount].to_i)
         mymemo = current_user.mymemos.new
         # mymemo.mymemos_ingredients.new(ingredient_id: @ingredient.id).save
         @total += @ingredient.total(ingredient[:amount].to_i)
         next if ingredient[:amount].to_i.zero? #　選んでない材料をなくすため
         @resources << { id: @ingredient.id, amount: ingredient[:amount].to_i } # Hash
      end
    end
  end

  def create
    # 「メモをしましょう」ボタンをおしたとき

    # @ingredient.update(amount: ingredient[:amount].to_i)
    # mymemo.mymemos_ingredients.new(ingredient_id: @ingredient.id).save
  end

  def destroy
    ingredient = Ingredient.find_by_id(params[:id])
    ingredient.destroy
    redirect_to users_calorie_dentakus_path, notice: "レシピを削除しました。"
  end

  private

  def calorie_dentaku_params
    params.require(:calorie_dentaku).permit(:calorie, :amount, :ingredient_name)
  end
end
