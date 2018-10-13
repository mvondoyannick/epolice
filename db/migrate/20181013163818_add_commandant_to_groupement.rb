class AddCommandantToGroupement < ActiveRecord::Migration[5.2]
  def change
    add_reference :groupements, :agent, foreign_key: true
    add_column :groupements, :phonecommandant, :string
    add_column :groupements, :emailcommandant, :string
    add_column :groupements, :localisation, :string
  end
end
