class RemoveCommissariatFromAgent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :agents, :commissariat, foreign_key: true
  end
end
