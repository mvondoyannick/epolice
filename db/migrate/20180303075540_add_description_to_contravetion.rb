class AddDescriptionToContravetion < ActiveRecord::Migration[5.1]
  def change
    add_column :contravetions, :description, :string
  end
end
