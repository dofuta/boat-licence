class AddNullFalseToBoats < ActiveRecord::Migration[5.2]
  def change
    change_column_null :boats, :address, false
    change_column_null :boats, :name, false
  end
end
