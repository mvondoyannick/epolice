class AddGroupementToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :groupement, foreign_key: true
  end
end
