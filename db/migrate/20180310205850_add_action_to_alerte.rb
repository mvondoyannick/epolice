class AddActionToAlerte < ActiveRecord::Migration[5.1]
  def change
    add_column :alertes, :action, :string
  end
end
