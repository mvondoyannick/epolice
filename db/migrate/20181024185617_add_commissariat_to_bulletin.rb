class AddCommissariatToBulletin < ActiveRecord::Migration[5.2]
  def change
    add_reference :bulletins, :commissariat, foreign_key: true
  end
end
