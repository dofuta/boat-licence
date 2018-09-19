class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name,                 :string, null: false
    add_index  :users, :name
    add_column :users, :name_furigana,        :string
    add_index  :users, :name_furigana
    add_column :users, :former_name,          :string
    add_column :users, :former_name_furigana, :string
    add_column :users, :gender,               :integer
    add_column :users, :birth,                :date
    add_column :users, :nationality,          :string
    add_column :users, :permanent_address,    :string
    add_column :users, :former_permanent_address, :string
    add_column :users, :license_number,       :integer
    add_column :users, :license_expiration_date, :date
    add_column :users, :license_status,       :integer
    add_column :users, :phone_number,         :integer
    add_column :users, :phone_number2,        :integer
    add_column :users, :postal_code,          :integer
    add_column :users, :address,              :string
    add_column :users, :postal_code2,         :integer
    add_column :users, :address2,             :string
    add_column :users, :admin,                :integer
    add_column :users, :teacher,              :integer
  end
end
