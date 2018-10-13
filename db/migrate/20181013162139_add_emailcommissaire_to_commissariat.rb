class AddEmailcommissaireToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_column :commissariats, :emailcommissaire, :string
  end
end
