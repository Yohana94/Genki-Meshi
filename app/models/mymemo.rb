class Mymemo < ApplicationRecord
  belongs_to :user
  has_many :mymemos_ingredients, dependent: :destroy
  has_many :ingredients, through: :mymemos_ingredients

  def total_calorie
    mymemos_ingredients.sum(&:total_calorie)
    # mymemos_ingredients.sum {|m| m.total_calorie }
    # mymemos_ingredients.sum do |m|
    #   m.total_calorie
    # end
  end
end
