class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.references :user, null: false
      t.date       :date, null: false
      t.timestamps
    end
  end
end
