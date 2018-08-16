class AddCodeToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :code, :string
  end
end
