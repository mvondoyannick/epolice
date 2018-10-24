class AddTokenagentToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :tokenagent, :string
  end
end
