class CreateAffectations < ActiveRecord::Migration[5.1]
  def change
    create_table :affectations do |t|
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
