class AddPostepoliceToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_reference :affectations, :postepolice, foreign_key: true
  end
end
