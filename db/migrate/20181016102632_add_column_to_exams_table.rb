class AddColumnToExamsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :exam_id, :int
  end
end
