class AddLocaToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_column :commissariats, :localisation, :string
  end
end
