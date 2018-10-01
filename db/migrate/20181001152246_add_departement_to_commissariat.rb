class AddDepartementToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_reference :commissariats, :departement, foreign_key: true
  end
end
