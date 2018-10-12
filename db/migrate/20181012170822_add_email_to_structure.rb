class AddEmailToStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :structures, :email, :string
    add_column :structures, :pwd, :string
  end
end
