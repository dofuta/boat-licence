class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    remove_column :exams,   :exam_place_id
    add_reference :exams,   :place,  foreign_key: true
  end
end
