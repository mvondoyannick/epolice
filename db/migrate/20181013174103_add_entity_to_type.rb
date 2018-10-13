class AddEntityToType < ActiveRecord::Migration[5.2]
  def change
    add_column :types, :entity, :string
  end
end
