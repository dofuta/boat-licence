class RxLesson < ApplicationRecord
  has_many :user_owend_rx_lessons
  has_many :users, through: :user_owned_rx_lessons
  belongs_to :place
end
