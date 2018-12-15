class Lesson < ApplicationRecord
  belongs_to :place
  has_many   :user_owned_lessons
  has_many   :user_teaching_lessons
  has_many   :users,    through: :user_owned_lessons
  has_many   :teachers, through: :user_teaching_lessons, source: :user
  has_many   :lessons_boats
  has_many   :boats,    through: :lessons_boats

  validates  :date,        presence: true
  validates  :type_number, presence: true
end
