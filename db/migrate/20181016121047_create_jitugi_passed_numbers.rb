class CreateJitugiPassedNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :jitugi_passed_numbers do |t|
      t.string :exam_id
      t.string :exam_number
      t.timestamps
    end
  end
end
