class CreateCarrefours < ActiveRecord::Migration[5.1]
  def change
    create_table :carrefours do |t|
      t.string :name
      t.string :quartier
      t.string :status
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
