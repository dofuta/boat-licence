class RenamePassedNuberssToGakkaPassedNumbers < ActiveRecord::Migration[5.2]
  def change
    rename_table :passed_numbers, :gakka_passed_numbers #この行を追加！
  end
end
