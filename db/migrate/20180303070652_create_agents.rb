class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :prenom
      t.string :phone
      t.string :matricule
      t.string :grade

      t.timestamps
    end
  end
end
