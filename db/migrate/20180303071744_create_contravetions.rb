class CreateContravetions < ActiveRecord::Migration[5.1]
  def change
    create_table :contravetions do |t|
      t.string :token
      t.string :motif
      t.string :status
      t.references :Agent, foreign_key: true

      t.timestamps
    end
  end
end
