class AddExpireToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :expire, :string
  end
end
