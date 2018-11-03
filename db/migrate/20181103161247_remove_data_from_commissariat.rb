class RemoveDataFromCommissariat < ActiveRecord::Migration[5.2]
  def change
    remove_column :commissariats, :emailcommissaire, :string
    remove_column :commissariats, :phonecommissaire, :string
    remove_reference :commissariats, :agent, foreign_key: true
  end
end
