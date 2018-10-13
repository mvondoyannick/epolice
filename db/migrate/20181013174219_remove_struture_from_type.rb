class RemoveStrutureFromType < ActiveRecord::Migration[5.2]
  def change
    remove_reference :types, :structure, foreign_key: true
  end
end
