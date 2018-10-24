class CreateBulletins < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletins do |t|
      t.string :order
      t.string :debut
      t.string :fin
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
