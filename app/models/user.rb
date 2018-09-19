class User < ApplicationRecord

  has_many :user_owned_exam,       dependent: :destroy
  has_many :user_owned_exams,      dependent: :destroy
  has_many :user_teaching_lessons, dependent: :destroy

  has_many :taken_lessons,    through: :user_owned_lessons,    source: :lesson
  has_many :taken_exams,      through: :user_owned_exams,      source: :exam
  has_many :teaching_lessons, through: :user_teaching_lessons, source: :lesson

  has_many :holidays,              dependent: :destroy

  # For friendships between users
  has_and_belongs_to_many :friendships, class_name: "User", join_table: :friendships, foreign_key: :user_id, association_foreign_key: :friend_user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
