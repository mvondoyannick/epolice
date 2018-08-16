class AddLatToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :latitude, :string
  end
end
