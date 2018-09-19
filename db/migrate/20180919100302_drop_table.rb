class DropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :lesson_places
  end
end
