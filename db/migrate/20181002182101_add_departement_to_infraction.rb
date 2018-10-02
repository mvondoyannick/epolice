class AddDepartementToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_reference :infractions, :departement, foreign_key: true
  end
end
