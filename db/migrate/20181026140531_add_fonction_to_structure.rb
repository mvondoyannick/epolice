class AddFonctionToStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :fonction, :string
  end
end
