class RemoveAdresseFromStructure < ActiveRecord::Migration[5.2]
  def change
    remove_column :structures, :adresse, :string
  end
end
