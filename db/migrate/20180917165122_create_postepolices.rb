class CreatePostepolices < ActiveRecord::Migration[5.2]
  def change
    create_table :postepolices do |t|
      t.string :name
      t.string :location
      t.references :agent, foreign_key: true
      t.references :commissariat, foreign_key: true

      t.timestamps
    end
  end
end
