class Change < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :type,  :type_number
  end
end
