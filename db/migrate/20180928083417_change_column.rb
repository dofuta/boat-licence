class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :user_owned_exams, :remark,  :text
  end
end
