class AddStatusToModepaiement < ActiveRecord::Migration[5.2]
  def change
    add_column :modepaiements, :status, :string
  end
end
