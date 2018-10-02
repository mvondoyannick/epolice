class RemoveVilleFromInfraction < ActiveRecord::Migration[5.2]
  def change
    remove_reference :infractions, :ville, foreign_key: true
  end
end
