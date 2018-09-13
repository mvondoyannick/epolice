class AddTokenToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_column :affectations, :token, :string
  end
end
