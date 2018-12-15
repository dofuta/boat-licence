class ChangeDataTypeOfImage < ActiveRecord::Migration[5.2]
  def change
    change_column :boats, :image, :string
  end
end
