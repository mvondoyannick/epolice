class AddMatriculeToFylo < ActiveRecord::Migration[5.2]
  def change
    add_column :fylos, :matricule, :string
  end
end
