class AddMoisToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :mois, :string
    add_column :convocations, :an, :string
  end
end
