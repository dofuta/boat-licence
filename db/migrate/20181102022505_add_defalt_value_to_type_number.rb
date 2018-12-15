class AddDefaltValueToTypeNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :type, :integer, null: false, default: 0
    add_column :lessons, :type, :integer, null: false, default: 0
    remove_column :exams, :type_number
    remove_column :lessons, :type_number
  end
end
