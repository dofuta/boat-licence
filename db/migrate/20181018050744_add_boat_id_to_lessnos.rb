class AddBoatIdToLessnos < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :boat
  end
end
