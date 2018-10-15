class AddLocalisationToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_column :affectations, :localisation, :string
  end
end
