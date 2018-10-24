class AddIndexToPassedNumber < ActiveRecord::Migration[5.2]
  def change
    add_index :gakka_passed_numbers,  [:exam_id, :exam_number, :type_number], unique: true, name: 'gakka_passed_numbers_index'
    add_index :jitugi_passed_numbers, [:exam_id, :exam_number, :type_number], unique: true, name: 'jitugi_passed_numbers_index'
  end
end
