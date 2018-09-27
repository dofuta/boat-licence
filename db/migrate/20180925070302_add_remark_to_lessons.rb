class AddRemarkToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :remark, :text
  end
end
