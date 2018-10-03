class AddPrenomToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :prenom, :string
  end
end
