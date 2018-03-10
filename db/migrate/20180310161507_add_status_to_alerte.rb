class AddStatusToAlerte < ActiveRecord::Migration[5.1]
  def change
    add_column :alertes, :status, :string
  end
end
