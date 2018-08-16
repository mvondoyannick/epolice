class AddRoleToFylo < ActiveRecord::Migration[5.2]
  def change
    add_reference :fylos, :role, foreign_key: true
  end
end
