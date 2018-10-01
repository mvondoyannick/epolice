class AddUniteToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :unite, foreign_key: true
  end
end
