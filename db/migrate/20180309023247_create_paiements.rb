class CreatePaiements < ActiveRecord::Migration[5.1]
  def change
    create_table :paiements do |t|
      t.string :montant
      t.references :convocation, foreign_key: true

      t.timestamps
    end
  end
end
