class AddVilleToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :ville, :string
    add_column :convocations, :quartier, :string
    add_column :convocations, :rue, :string
  end
end
