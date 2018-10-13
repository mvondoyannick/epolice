class CreateCentrepartenaires < ActiveRecord::Migration[5.2]
  def change
    create_table :centrepartenaires do |t|
      t.string :name
      t.references :structure, foreign_key: true

      t.timestamps
    end
  end
end
