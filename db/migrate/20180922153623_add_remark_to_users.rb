class AddRemarkToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remark, :text
  end
end
