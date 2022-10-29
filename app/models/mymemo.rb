class Mymemo < ApplicationRecord
  belongs_to :user
  has_many :mymemos_ingredients, dependent: :destroy
  has_many :ingredients, through: :mymemos_ingredients

  def total_calorie
    mymemos_ingredients.sum do |mymemos_ingredient|
      mymemos_ingredient.ingredient.total(mymemos_ingredient.amount)
    end
  end
end
