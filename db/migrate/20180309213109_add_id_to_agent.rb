class AddIdToAgent < ActiveRecord::Migration[5.1]
  def change
    add_reference :agents, :commissariat, foreign_key: true
  end
end
