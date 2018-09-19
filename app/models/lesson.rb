class Lesson < ApplicationRecord
  belongs_to :place
  has_many   :user_owned_lessons
  has_many   :users, through: :user_owned_lessons
  has_many   :users, through: :user_teaching_lessons
end
