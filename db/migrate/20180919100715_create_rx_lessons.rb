class CreateRxLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :rx_lessons do |t|
      t.references :user,     null: false
      t.references :place
      t.integer    :type,     null: false
      t.datetime   :datetime, null: false
      t.text       :gg_event_id
      t.timestamps
    end
  end
end
