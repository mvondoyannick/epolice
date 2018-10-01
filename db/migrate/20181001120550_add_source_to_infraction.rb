class AddSourceToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_column :infractions, :source, :string
    add_reference :infractions, :zonecouverturemotif, foreign_key: true
  end
end
