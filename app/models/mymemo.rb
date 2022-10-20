class Mymemo < ApplicationRecord
  belongs_to :user
  has_many :mymemos_ingredients
  has_many :ingredients, through: :mymemos_ingredients
end
