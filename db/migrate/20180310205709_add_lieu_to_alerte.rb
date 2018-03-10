class AddLieuToAlerte < ActiveRecord::Migration[5.1]
  def change
    add_column :alertes, :lieu, :string
  end
end
