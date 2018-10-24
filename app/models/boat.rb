class Boat < ApplicationRecord
  has_many :lessons_boats
  has_many :lessons, through: :lessons_boats
end
