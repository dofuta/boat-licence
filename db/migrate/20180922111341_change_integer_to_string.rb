class ChangeIntegerToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number,  :string
    change_column :users, :phone_number2, :string
    change_column :users, :postal_code,   :string
    change_column :users, :postal_code2,  :string
    change_column :users, :license_number,:string
    change_column :user_owned_rx_lessons, :reservation_number, :string
    change_column :user_owned_exams, :exam_number, :string
  end
end
