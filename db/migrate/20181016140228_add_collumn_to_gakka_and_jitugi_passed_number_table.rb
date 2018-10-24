class AddCollumnToGakkaAndJitugiPassedNumberTable < ActiveRecord::Migration[5.2]
  def change
    add_column :gakka_passed_numbers, :type_number, :int
    add_column :jitugi_passed_numbers, :type_number, :int
  end
end
