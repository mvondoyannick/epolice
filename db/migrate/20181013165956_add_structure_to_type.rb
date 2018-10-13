class AddStructureToType < ActiveRecord::Migration[5.2]
  def change
    add_reference :types, :structure, foreign_key: true
  end
end
