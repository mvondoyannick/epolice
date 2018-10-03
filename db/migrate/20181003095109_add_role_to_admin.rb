class AddRoleToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :role, foreign_key: true
  end
end
