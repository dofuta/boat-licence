class AddTypeNumberToExamAndLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :type_number, :integer, null: false
    add_column :lessons, :type_number, :integer, null: false
    remove_column :exams, :type
    remove_column :lessons, :type
  end
end
