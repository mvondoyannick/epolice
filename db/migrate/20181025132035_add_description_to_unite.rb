class AddDescriptionToUnite < ActiveRecord::Migration[5.2]
  def change
    add_column :unites, :description, :string
  end
end
