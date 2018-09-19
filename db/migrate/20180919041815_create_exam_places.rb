class CreateExamPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_places do |t|
      t.string :facility_name, null: false
      t.string :address,       null: false
      t.text   :map_image
      t.text   :url
      t.timestamps
    end
  end
end
