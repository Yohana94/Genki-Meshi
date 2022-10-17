class Mymemo < ApplicationRecord
  has_many :users
  has_many :ingredients
end
