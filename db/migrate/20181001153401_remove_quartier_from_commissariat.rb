class RemoveQuartierFromCommissariat < ActiveRecord::Migration[5.2]
  def change
    remove_column :commissariats, :quartier, :string
  end
end
