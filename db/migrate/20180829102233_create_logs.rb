class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :browser
      t.string :address
      t.string :controller
      t.string :action
      t.string :date

      t.timestamps
    end
  end
end
