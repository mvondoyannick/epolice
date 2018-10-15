class AddCommissariatToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_reference :affectations, :commissariat, foreign_key: true
  end
end
