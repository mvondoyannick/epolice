class RemoveMoiFromConvocation < ActiveRecord::Migration[5.1]
  def change
    remove_column :convocations, :mois, :string
  end
end
