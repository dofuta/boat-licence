class Exam < ApplicationRecord
  has_many :user_owned_exams
  has_many :users, through: :user_owned_exams
  has_one  :exam_place
end
