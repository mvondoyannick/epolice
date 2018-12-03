class AddLieuditToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :lieudit, :string
    add_reference :alertes, :arrondissement, foreign_key: true
  end
end
