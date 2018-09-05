class AddDebutToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_column :affectations, :debut, :string
  end
end
