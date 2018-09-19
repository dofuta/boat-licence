class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user
      t.references :lesson_place
      t.integer    :type,        null: false
      t.date       :date,        null: false
      t.text       :gg_event_id
      t.timestamps
    end
  end
end
