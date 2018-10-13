class AddDepartementToCentrepartenaire < ActiveRecord::Migration[5.2]
  def change
    add_reference :centrepartenaires, :departement, foreign_key: true
  end
end
