class RemoveJourFromConvocation < ActiveRecord::Migration[5.1]
  def change
    remove_column :convocations, :jour, :string
  end
end
