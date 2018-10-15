class AddRegionToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_reference :affectations, :region, foreign_key: true
  end
end
