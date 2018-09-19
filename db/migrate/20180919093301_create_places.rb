class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :facility_name, null: false
      t.string :address,       null: false
      t.text   :map_image
      t.text   :url
      t.timestamps
    end
  end
end
