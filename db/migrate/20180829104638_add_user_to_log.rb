class AddUserToLog < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :user, :string
    add_column :logs, :role, :string
  end
end
