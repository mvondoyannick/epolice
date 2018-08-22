class AddVilleToCarrefour < ActiveRecord::Migration[5.2]
  def change
    add_reference :carrefours, :ville, foreign_key: true
  end
end
