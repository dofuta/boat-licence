class Place < ApplicationRecord
  has_many :exams
  has_many :lessons
end
