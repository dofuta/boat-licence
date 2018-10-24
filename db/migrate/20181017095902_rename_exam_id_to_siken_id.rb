class RenameExamIdToSikenId < ActiveRecord::Migration[5.2]
  def change
    rename_column :exams,                 :exam_id, :siken_id
    rename_column :gakka_passed_numbers,  :exam_id, :siken_id
    rename_column :jitugi_passed_numbers, :exam_id, :siken_id
  end
end
