class Users::CalorieDentakusController < ApplicationController
  def show
    @calorie_dentaku = Calorie_dentaku.find(params[:id])
  end
  
  private

  def calorie_dentaku_params
    params.require(:calorie_dentaku).permit(:name, :image, :body, :nutrition, :genre_id, :ingredient_name)
  end
end
