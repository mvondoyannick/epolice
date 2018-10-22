class RemoveVilleFromAlerte < ActiveRecord::Migration[5.2]
  def change
    remove_reference :alertes, :ville, foreign_key: true
  end
end
