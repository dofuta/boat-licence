class CreateUserOwnedLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_owned_lessons do |t|
      t.references :user, null: false
      t.references :lesson, null: false
      t.integer    :payment_confirmation
      t.text       :remark
      t.timestamps
    end
  end
end
