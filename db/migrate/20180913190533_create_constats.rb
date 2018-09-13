class CreateConstats < ActiveRecord::Migration[5.2]
  def change
    create_table :constats do |t|
      t.string :name1
      t.string :name2
      t.string :phone1
      t.string :phone2
      t.string :cni1
      t.string :cni2
      t.string :immatriculation1
      t.string :immatriculation2
      t.string :marque1
      t.string :marque2
      t.string :police1
      t.string :police2
      t.references :typeaccident, foreign_key: true

      t.timestamps
    end
  end
end
