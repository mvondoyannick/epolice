class AddDepartementToBulletin < ActiveRecord::Migration[5.2]
  def change
    add_reference :bulletins, :departement, foreign_key: true
    add_column :bulletins, :localisation, :string
  end
end
