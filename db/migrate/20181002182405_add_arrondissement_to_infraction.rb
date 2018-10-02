class AddArrondissementToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_reference :infractions, :arrondissement, foreign_key: true
  end
end
