class AddClasseToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_column :infractions, :classe, :string
  end
end
