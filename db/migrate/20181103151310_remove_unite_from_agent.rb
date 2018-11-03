class RemoveUniteFromAgent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :agents, :unite, foreign_key: true
  end
end
