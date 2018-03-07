class RemoveMoisFromConvocation < ActiveRecord::Migration[5.1]
  def change
    remove_column :convocations, :mois, :string
    remove_column :convocations, :an, :string
  end
end
