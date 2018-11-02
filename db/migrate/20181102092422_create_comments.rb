class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.references :alerte, foreign_key: true

      t.timestamps
    end
  end
end
