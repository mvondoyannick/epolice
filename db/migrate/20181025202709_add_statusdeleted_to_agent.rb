class AddStatusdeletedToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :statusdeleted, :boolean
  end
end
