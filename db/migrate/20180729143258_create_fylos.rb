class CreateFylos < ActiveRecord::Migration[5.2]
  def change
    create_table :fylos do |t|
      t.string :name
      t.string :prenom
      t.string :phone
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
