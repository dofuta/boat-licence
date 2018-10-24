class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.text   :address
      t.text   :image
      t.timestamps
    end
  end
end
