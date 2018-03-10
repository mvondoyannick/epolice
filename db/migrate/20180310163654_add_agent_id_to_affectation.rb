class AddAgentIdToAffectation < ActiveRecord::Migration[5.1]
  def change
    add_reference :affectations, :agent, foreign_key: true
  end
end
