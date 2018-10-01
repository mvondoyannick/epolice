class AddAgeToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :age, :string
  end
end
