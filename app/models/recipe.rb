class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :admin, optional: true
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :ingredients

  paginates_per 8

  def self.search_by(search_term)
    if search_term.present?
      where("LOWER(recipe_name) LIKE :search_term",
      search_term: "%#{search_term.downcase}%")
    else
      Recipe.all
    end
  end
end