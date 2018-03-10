class AddDateToAffectation < ActiveRecord::Migration[5.1]
  def change
    add_column :affectations, :date, :string
  end
end
