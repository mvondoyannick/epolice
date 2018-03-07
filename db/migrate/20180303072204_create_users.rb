class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :prenom
      t.string :sexe
      t.string :cartegrise
      t.string :immatriculation
      t.string :phone

      t.timestamps
    end
  end
end
