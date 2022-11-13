class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :mymemos
  has_many :mymemos_ingredients, through: :mymemos
  belongs_to :admin, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
