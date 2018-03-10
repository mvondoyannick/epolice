class AddCarrefourIdToAffectation < ActiveRecord::Migration[5.1]
  def change
    add_reference :affectations, :carrefour, foreign_key: true
  end
end
