class RemoveTypeFromAffectation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :affectations, :type, foreign_key: true
  end
end
