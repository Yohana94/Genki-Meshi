class Recipe < ApplicationRecord
  paginates_per 8
  has_one_attached :image
  belongs_to :admin, optional: true
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :ingredients
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search_by(search_term)
    if search_term.present?
      where("LOWER(recipe_name) LIKE :search_term",
      search_term: "%#{search_term.downcase}%")
    else
      Recipe.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
