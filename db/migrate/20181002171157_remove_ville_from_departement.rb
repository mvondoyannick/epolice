class RemoveVilleFromDepartement < ActiveRecord::Migration[5.2]
  def change
    remove_reference :departements, :ville, foreign_key: true
  end
end
