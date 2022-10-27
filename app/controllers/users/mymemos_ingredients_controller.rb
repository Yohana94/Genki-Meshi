class Users::MymemosIngredientsController < ApplicationController
  def destroy
    mymemos_ingredient = current_user.mymemos_ingredients.find(params[:id])
    mymemos_ingredient.destroy!
    redirect_to users_mymemo_path(mymemos_ingredient.mymemo)
  end
end
