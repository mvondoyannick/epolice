class AddAgentIdToAlerte < ActiveRecord::Migration[5.1]
  def change
    add_reference :alertes, :agent, foreign_key: true
  end
end
