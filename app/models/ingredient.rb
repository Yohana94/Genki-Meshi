class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :mymemo, optional: true
  has_one_attached :image
end
