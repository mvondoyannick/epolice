class AddArchiveToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :archive, :string
  end
end
