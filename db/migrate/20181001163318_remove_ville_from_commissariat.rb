class RemoveVilleFromCommissariat < ActiveRecord::Migration[5.2]
  def change
    remove_reference :commissariats, :ville, foreign_key: true
  end
end
