class CreatePassedNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :passed_numbers do |t|
      t.string :exam_id
      t.string :exam_number
      t.timestamps
    end
  end
end
