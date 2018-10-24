class RemoveColumnFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :boat_id, :int
  end
end
