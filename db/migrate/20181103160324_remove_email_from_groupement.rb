class RemoveEmailFromGroupement < ActiveRecord::Migration[5.2]
  def change
    remove_column :groupements, :email, :string
    remove_column :groupements, :emailcommandant, :string
    remove_reference :groupements, :agent, foreign_key: true
  end
end
