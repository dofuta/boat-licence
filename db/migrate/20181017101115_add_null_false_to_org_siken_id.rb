class AddNullFalseToOrgSikenId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :gakka_passed_numbers,  :org_siken_id, true
    change_column_null :jitugi_passed_numbers, :org_siken_id, true
  end
end
