class AddCatToStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :category, :string
  end
end
