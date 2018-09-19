class Exam < ApplicationRecord
  belongs_to :place
  has_many   :user_owned_exams
  has_many   :users, through: :user_owned_exams
end
