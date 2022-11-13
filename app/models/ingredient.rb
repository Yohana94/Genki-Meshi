class Ingredient < ApplicationRecord
  has_many :mymemos_ingredients, dependent: :destroy
  paginates_per 8
  belongs_to :recipe, optional: true
  has_one_attached :image

  attribute :amount, :integer

  def total(amount)
    calorie * amount
  end
end
