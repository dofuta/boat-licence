class JitugiPassedNumber < ApplicationRecord
  validates :exam_id,
    uniqueness: {
      message: ", exam_number, type_numberが同じ組み合わせのレコードが既に存在します。",
      scope: [:exam_number, :type_number]
    }
end
