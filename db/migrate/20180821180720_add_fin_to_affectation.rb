class AddFinToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_column :affectations, :fin, :string
  end
end
