class Users::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.page(params[:page]).per(8)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
