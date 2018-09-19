class CreateUserOwnedExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_owned_exams do |t|
      t.references :user, null: false
      t.references :exam, null: false
      t.integer    :payment_confirmation
      t.integer    :re_exam_status
      t.integer    :shintaikensa_status
      t.integer    :exam_ticket
      t.integer    :text_book
      t.integer    :exam_number
      t.integer    :pass_or_fail
      t.integer    :remark
      t.timestamps
    end
  end
end
