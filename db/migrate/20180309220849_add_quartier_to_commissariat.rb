class AddQuartierToCommissariat < ActiveRecord::Migration[5.1]
  def change
    add_column :commissariats, :quartier, :string
  end
end
