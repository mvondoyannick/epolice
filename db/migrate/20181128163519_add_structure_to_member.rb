class AddStructureToMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :structure, foreign_key: true
  end
end
