class AddOrgSikenIdToExamsAndEachPassedNumbersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exams,                 :org_siken_id, :string
    add_column :gakka_passed_numbers,  :org_siken_id, :string
    add_column :jitugi_passed_numbers, :org_siken_id, :string
  end
end
