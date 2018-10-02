class RemoveVilleFromAgent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :agents, :ville, foreign_key: true
  end
end
