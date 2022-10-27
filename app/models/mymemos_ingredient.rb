class MymemosIngredient < ApplicationRecord
  belongs_to :mymemo
  belongs_to :ingredient

  def total_calorie
    ingredient.calorie * amount
  end
end
