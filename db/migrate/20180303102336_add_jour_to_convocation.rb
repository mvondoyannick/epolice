class AddJourToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :jour, :string
    add_column :convocations, :mois, :string
    add_column :convocations, :an, :string
    add_column :convocations, :sexe, :string
  end
end
