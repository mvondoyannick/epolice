class AddEmailToFylo < ActiveRecord::Migration[5.2]
  def change
    add_column :fylos, :email, :string
  end
end
