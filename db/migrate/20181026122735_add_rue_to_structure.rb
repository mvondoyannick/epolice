class AddRueToStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :rue, :string
    add_column :structures, :bp, :string
    add_column :structures, :phonestructure, :string
  end
end
