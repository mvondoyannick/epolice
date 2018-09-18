class AddRoleToMetropoli < ActiveRecord::Migration[5.2]
  def change
    add_reference :metropolis, :metropolisrole, foreign_key: true
  end
end
