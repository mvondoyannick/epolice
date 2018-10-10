class CreateCentrerecouvrements < ActiveRecord::Migration[5.2]
  def change
    create_table :centrerecouvrements do |t|
      t.string :name
      t.string :phone
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
