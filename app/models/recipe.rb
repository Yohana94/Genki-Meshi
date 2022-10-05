class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :admin, optional: true
  belongs_to :user, optional: true
  #has_many :ingredients
  #has_many :genres

  def self.search(search)
    if search
      Recipe.where(["name LIKE ?","%#{search}%"])
    else
      Recipe.all
    end
  end
end