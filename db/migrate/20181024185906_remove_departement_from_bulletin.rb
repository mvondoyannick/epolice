class RemoveDepartementFromBulletin < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bulletins, :departement, foreign_key: true
  end
end
