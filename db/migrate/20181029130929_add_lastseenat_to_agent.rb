class AddLastseenatToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :lastseenat, :string
  end
end
