class DropExamPlaceTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :exam_places
  end
end
