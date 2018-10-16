class ChangeColumnInExamsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :exams, :exam_id, :string
  end
end
