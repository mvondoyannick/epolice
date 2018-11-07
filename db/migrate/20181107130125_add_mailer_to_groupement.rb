class AddMailerToGroupement < ActiveRecord::Migration[5.2]
  def change
    add_column :groupements, :mail, :string
  end
end
