class AddVilleToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :ville, foreign_key: true
  end
end
