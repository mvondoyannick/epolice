class CreatePostCommissariats < ActiveRecord::Migration[5.2]
  def change
    create_table :post_commissariats do |t|
      t.references :commissariat, foreign_key: true
      t.references :agent, foreign_key: true
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
