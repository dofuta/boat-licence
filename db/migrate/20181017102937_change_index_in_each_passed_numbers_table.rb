class ChangeIndexInEachPassedNumbersTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :gakka_passed_numbers,  column: [:siken_id, :exam_number, :type_number],  name: 'gakka_passed_numbers_index'
    remove_index :jitugi_passed_numbers, column: [:siken_id, :exam_number, :type_number],  name: 'jitugi_passed_numbers_index'
    add_index :gakka_passed_numbers, :org_siken_id, unique: true
    add_index :jitugi_passed_numbers, :org_siken_id, unique: true
  end
end
