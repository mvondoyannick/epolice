class AddLonToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :longitude, :string
  end
end
