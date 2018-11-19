class AddLockToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :lock, :string
  end
end
