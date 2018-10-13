class AddPersonneToCentrepartenaire < ActiveRecord::Migration[5.2]
  def change
    add_column :centrepartenaires, :localisation, :string
    add_column :centrepartenaires, :nom, :string
    add_column :centrepartenaires, :prenom, :string
    add_column :centrepartenaires, :fonction, :string
    add_column :centrepartenaires, :phone, :string
    add_column :centrepartenaires, :email, :string
  end
end
