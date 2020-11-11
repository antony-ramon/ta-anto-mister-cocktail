class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  validates :description, presence: true
end
