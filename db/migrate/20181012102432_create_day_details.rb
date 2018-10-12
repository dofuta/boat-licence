class CreateDayDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :day_details do |t|
      t.date :date
      t.text :remark
      t.timestamps
    end
  end
end
