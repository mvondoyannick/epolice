class RemoveDataFromGroupement < ActiveRecord::Migration[5.2]
  def change
    remove_column :groupements, :phonecommandant, :string
    remove_column :groupements, :localisation, :string
    remove_column :groupements, :email, :string
  end
end
