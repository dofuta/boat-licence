class UserOwnedRxLesson < ApplicationRecord
  belongs_to :user
  belongs_to :rx_lesson
end
