class RemoveDateFromAffectation < ActiveRecord::Migration[5.2]
  def change
    remove_column :affectations, :date, :string
  end
end
