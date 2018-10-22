class GakkaPassedNumber < ApplicationRecord
  validates :org_siken_id, uniqueness: true
  belongs_to :exam, primary_key: "org_siken_id", foreign_key: "org_siken_id"
end
