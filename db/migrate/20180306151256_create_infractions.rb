class CreateInfractions < ActiveRecord::Migration[5.1]
  def change
    create_table :infractions do |t|
      t.string :motif
      t.string :montant

      t.timestamps
    end
  end
end
