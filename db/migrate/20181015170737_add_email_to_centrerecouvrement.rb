class AddEmailToCentrerecouvrement < ActiveRecord::Migration[5.2]
  def change
    add_column :centrerecouvrements, :email, :string
    add_column :centrerecouvrements, :localisation, :string
  end
end
