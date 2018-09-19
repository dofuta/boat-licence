class CreateUserOwnedRxLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_owned_rx_lessons do |t|
      t.references :user, null: false
      t.references :rx_lesson, null: false
      t.integer    :renewal_or_expiration, null: false
      t.integer    :payment_confirmation
      t.integer    :shintaikensa_status
      t.integer    :reservation_number
      t.text       :remark
      t.timestamps
    end
  end
end
