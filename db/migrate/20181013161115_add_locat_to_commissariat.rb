class AddLocatToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_column :commissariats, :phonecommissaire, :string
    add_reference :commissariats, :agent, foreign_key: true
  end
end
