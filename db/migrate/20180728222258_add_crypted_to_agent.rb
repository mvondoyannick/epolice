class AddCryptedToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :crypted, :string
  end
end
