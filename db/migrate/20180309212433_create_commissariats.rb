class CreateCommissariats < ActiveRecord::Migration[5.1]
  def change
    create_table :commissariats do |t|
      t.string :name
      t.string :phone
      t.references :ville, foreign_key: true

      t.timestamps
    end
  end
end
