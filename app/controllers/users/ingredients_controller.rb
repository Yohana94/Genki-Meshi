class Users::IngredientsController < ApplicationController
  def index
    @total = 0
    if params[:ingredients].present?
       params[:ingredients].each do |ingredient|
       @ingredient = Ingredient.find(ingredient[:ingredient_id])
       @ingredient.amount = ingredient[:amount]
       @ingredient.save
       @total += @ingredient.calorie * ingredient[:amount].to_i
      end
    end

    @ingredients = Ingredient.all
  end
end
