class AddMailToGroupement < ActiveRecord::Migration[5.2]
  def change
    add_column :groupements, :email, :string
  end
end
