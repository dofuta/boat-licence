class ChangeColumnNameToTypeNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :exams, :type, :type_number
  end
end
