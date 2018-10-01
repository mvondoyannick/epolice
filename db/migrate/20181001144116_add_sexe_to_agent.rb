class AddSexeToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :sexe, :string
  end
end
