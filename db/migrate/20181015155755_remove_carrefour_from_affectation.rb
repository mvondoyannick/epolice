class RemoveCarrefourFromAffectation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :affectations, :carrefour, foreign_key: true
  end
end
