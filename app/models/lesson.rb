class Lesson < ApplicationRecord
  has_many :user_owned_lessons
  has_one  :lesson_place
  has_many :users, through: :user_owned_lessons
  has_many :users, through: :user_teaching_lessons
end
