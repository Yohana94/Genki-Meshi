class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true
  has_one_attached :image
end
