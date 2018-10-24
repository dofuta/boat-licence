class CreateLessonsBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons_boats do |t|
      t.references :lesson, null: false
      t.references :boat,   null: false
      t.timestamps
    end
  end
end
