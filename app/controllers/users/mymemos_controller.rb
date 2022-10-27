class Users::MymemosController < ApplicationController
  def show
    @mymemo = current_user.mymemos.find(params[:id])
  end

 def create
   # param(String) to @resouces(Hash)
    mymemo = current_user.mymemos.new
    params[:ingredient].each do |ingredient|
      id, amount = ingredient.split(' ')
      mymemo.mymemos_ingredients.new(ingredient_id: id, amount: amount)
    end
    # User.new(name: "aa").save
    # User.create(name: "aa")
    mymemo.save!
    redirect_to users_mymemo_path(mymemo.id)
 end

  def destroy
    # binding.pry
    ingredient = Ingredient.find(params[:id])
    # ingredient.destroy
    ingredient.update(amount: 0)
    redirect_to users_mymemos_path, notice: "メモを削除しました。"
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name, :calorie, :amount)
  end
end
