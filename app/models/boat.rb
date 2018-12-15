class Boat < ApplicationRecord
  has_many :lessons_boats
  has_many :lessons, through: :lessons_boats

  validates  :name,        presence: true
  validates  :address,     presence: true
end
