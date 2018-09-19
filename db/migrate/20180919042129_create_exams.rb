class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :exam_place
      t.date    :date, null: false
      t.integer :type, null: false
      t.date    :announcement_date
      t.text    :gg_event_id
      t.timestamps
    end
  end
end
