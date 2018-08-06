class AddLastConnectedToFylo < ActiveRecord::Migration[5.2]
  def change
    add_column :fylos, :lastConnected, :string
  end
end
