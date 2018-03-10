class CreateAlertes < ActiveRecord::Migration[5.1]
  def change
    create_table :alertes do |t|
      t.string :titre
      t.string :description
      t.string :date
      t.references :ville, foreign_key: true

      t.timestamps
    end
  end
end
