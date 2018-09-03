class CreatePieceretenus < ActiveRecord::Migration[5.2]
  def change
    create_table :pieceretenus do |t|
      t.string :name
      t.string :detail

      t.timestamps
    end
  end
end
