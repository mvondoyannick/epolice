class CreateVilles < ActiveRecord::Migration[5.1]
  def change
    create_table :villes do |t|
      t.string :name
      t.string :long
      t.string :lat

      t.timestamps
    end
  end
end
