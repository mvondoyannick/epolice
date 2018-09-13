class AddStatusToAffectation < ActiveRecord::Migration[5.2]
  def change
    add_column :affectations, :status, :string
  end
end
