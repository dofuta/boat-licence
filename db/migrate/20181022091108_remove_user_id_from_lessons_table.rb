class RemoveUserIdFromLessonsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :user_id, :int
  end
end
