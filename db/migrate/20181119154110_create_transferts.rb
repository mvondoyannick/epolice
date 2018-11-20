class CreateTransferts < ActiveRecord::Migration[5.2]
  def change
    create_table :transferts do |t|
      t.references :agent, foreign_key: true
      t.references :convocation, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
