class Lesson < ApplicationRecord
  belongs_to :place
  has_many   :user_owned_lessons
  has_many   :user_teaching_lessons
  has_many   :users, through: :user_owned_lessons
  has_many   :teachers, through: :user_teaching_lessons, source: :user
end
