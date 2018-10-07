class AddRemarkToExams < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :remark, :text
  end
end
