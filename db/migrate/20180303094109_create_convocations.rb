class CreateConvocations < ActiveRecord::Migration[5.1]
  def change
    create_table :convocations do |t|
      t.string :cni
      t.string :phone
      t.string :name
      t.string :prenom
      t.string :immatriculation
      t.string :residence
      t.string :emploi
      t.string :motif
      t.string :observation
      t.string :pieceretenue

      t.timestamps
    end
  end
end
