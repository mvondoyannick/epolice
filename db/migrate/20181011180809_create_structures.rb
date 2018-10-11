class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :raison
      t.string :adresse
      t.string :contactname
      t.string :contantprenom
      t.string :contactphone
      t.string :contactemail
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
