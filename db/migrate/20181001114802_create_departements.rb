class CreateDepartements < ActiveRecord::Migration[5.2]
  def change
    create_table :departements do |t|
      t.string :name
      t.references :ville, foreign_key: true

      t.timestamps
    end
  end
end
