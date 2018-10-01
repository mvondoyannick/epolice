class AddVilleToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_reference :infractions, :ville, foreign_key: true
  end
end
