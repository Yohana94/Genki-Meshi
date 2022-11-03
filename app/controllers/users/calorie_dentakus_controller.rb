class Users::CalorieDentakusController < ApplicationController
  def index
    items =JSON.parse(params[:ingredients])#it`s javasript code for object method
    @ingredients = items.each.map do |k, v|#for bringing key and value from item to delete directly
      # binding.pry
      if v != 0 || params[:delete_ingredient] != k #when it`s not zero or sending the params
        ingredient = Ingredient.find(k)
        ingredient.amount = v
        ingredient
      end
    end.compact

    @total = @ingredients.map{|o| o.calorie * o.amount }.sum
    @resources = @ingredients.map{|o| { id: o.id, amount: o.amount }}
    params[:ingredients] = Hash[*@ingredients.map{|o| [o.id, o.amount]}.flatten].to_json 
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
