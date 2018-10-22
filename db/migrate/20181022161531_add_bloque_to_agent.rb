class AddBloqueToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :bloque, :string
  end
end
