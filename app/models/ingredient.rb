class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :mymemo
  has_one_attached :image
end
